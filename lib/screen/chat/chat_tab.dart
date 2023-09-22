import 'dart:async';

import 'package:excel_chat/main.dart';
import 'package:flutter/material.dart';
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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () { scrollToBottom(); });
    final chatInfo = ref.watch(chatInfoProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CustomPaint(
          painter: GridBackgroundPainter(),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyUpEvent && event.data is RawKeyEventDataWeb) {
                final data = event.data as RawKeyEventDataWeb;
                if (data.code == 'Escape') {
                  ref.read(lockImageProvider.notifier).updateTabIndex(-1);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(scrollbars: false),
                child: switch(chatInfo) {
                  AsyncData(:final value) => ListView.builder(
                    controller: _scrollController,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) => MessageWidget(
                      nick: value.messages[index].nick,
                      date: value.messages[index].date,
                      message: value.messages[index].msg,
                      mine: value.messages[index].nick == ref.read(myInfoProvider.notifier).getNick(),
                    ),
                  ),
                  AsyncError(:final error) => ListView.builder(
                    controller: _scrollController,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      MessageWidget(nick: 'error', date: 'error', message: 'error', mine: true);
                    },
                  ),
                  _ => ListView.builder(
                    controller: _scrollController,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      MessageWidget(nick: 'error', date: 'error', message: 'error', mine: true);
                    },
                  ),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 50,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
