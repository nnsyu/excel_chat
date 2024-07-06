import 'dart:async';

import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/grid_background_painter.dart';
import 'components/message_widget.dart';

class ChatTab extends ConsumerStatefulWidget {
  const ChatTab({super.key});

  @override
  ConsumerState<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends ConsumerState<ChatTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final chatInfo = ref.read(chatInfoProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CustomPaint(
          painter: GridBackgroundPainter(),
          child: KeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKeyEvent: (KeyEvent event) {
              if(event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.escape) {
                ref.read(lockImageProvider.notifier).updateTabIndex(-1);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(scrollbars: false),
                child: StreamBuilder(
                  stream: ref.read(chatInfoProvider.notifier).listenMessages(ref.read(myInfoProvider.notifier).getCode()).onValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      final data = snapshot.data?.snapshot.value as List<dynamic>;
                      final dataMapList = List<Map<String, dynamic>>.from(data);
                      final msgList = dataMapList.map((map) => UserInfo.fromJson(map)).toList();

                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        _scrollToBottom();
                      });

                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: msgList.length,
                        itemBuilder: (context, index) => MessageWidget(
                          nick: msgList[index].nick,
                          date: msgList[index].date,
                          message: msgList[index].msg,
                          mine: msgList[index].nick ==
                              ref.read(myInfoProvider.notifier).getNick(),
                        ),
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void scrollToBottom() {
  //   _scrollController.animateTo(
  //     _scrollController.position.maxScrollExtent + 50,
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
