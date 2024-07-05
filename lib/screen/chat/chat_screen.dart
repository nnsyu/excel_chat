import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/lock_image_provider.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/model/user_info.dart';
import 'package:excel_chat/screen/chat/chat_tab.dart';
import 'package:excel_chat/screen/chat/components/chat_sheet.dart';
import 'package:excel_chat/screen/chat/components/grid_background_painter.dart';
import 'package:excel_chat/screen/chat/components/grid_painter.dart';
import 'package:excel_chat/screen/chat/components/message_widget.dart';
import 'package:excel_chat/service/firebase_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final lockImageProvider = NotifierProvider<LockImageNotifier, LockImage>(() {
//   return LockImageNotifier();
// });

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late TextEditingController _messageController;
  //late ScrollController _scrollController;
  late FocusNode _focusNode;

  //String title = '엑셀제목제목';

  //List<MessageWidget> messageList = [];

  //final TAB_LOCK = -1;

  //late int selectTabIndex;
  //late int beforeIndex;

  Future<LockImage> loadInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String url = pref.getString('lock_url') ?? '';
    String binary = pref.getString('lock_binary') ?? '';
    return LockImage(url: url, binary: binary);
  }

  @override
  void initState() {
    super.initState();
    //selectTabIndex = TAB_LOCK;
    //beforeIndex = TAB_LOCK;

    Future<LockImage> info = loadInfo();
    info.then((value) => ref.read(lockImageProvider.notifier).updateInfo(value.url, value.binary));

    _messageController = TextEditingController();
    //_scrollController = ScrollController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _messageController.dispose();
    //_scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build !!!!!!!!!!!!!!!!!');

    final lockImage = ref.watch(lockImageProvider);
    //final chatInfo = ref.watch(chatInfoProvider);
    final myInfo = ref.watch(myInfoProvider);

    //print(ref.read(chatInfoProvider.notifier).future.then((value) => print('roomName : ${value.roomName}, roomCode : ${value.roomCode}, messages : ${value.messages.toString()}')));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/excel.png',
                  width: 22,
                  height: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/images/save.png',
                  width: 22,
                  height: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/images/undo.png',
                  width: 22,
                  height: 22,
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/images/redo.png',
                  width: 22,
                  height: 22,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: ref.read(myInfoProvider.notifier).getCode()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('방 코드가 복사되었습니다!')),
                      );
                    },
                    child: Text(
                      '${ref.read(myInfoProvider.notifier).getCode()}.xlsx - Excel',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Icon(
                  Icons.minimize,
                  size: 17,
                ),
                const SizedBox(
                  width: 7,
                ),
                Icon(Icons.fullscreen, size: 17),
                const SizedBox(
                  width: 7,
                ),
                Icon(Icons.close, size: 17),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  ref.read(lockImageProvider.notifier).updateIsChange(false);
                  Navigator.pushNamed(context, '/join');
                },
                child: Container(
                  color: const Color(0xFF217346),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.8, horizontal: 20),
                    child: Text(
                      '파일',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    left: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                  child: Text(
                    '홈',
                    style: TextStyle(
                        color: Color(0xFF217346),
                        fontSize: 12.5,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '삽입',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '페이지 레이아웃',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '수식',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '데이터',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '검토',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '보기',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.8, horizontal: 15),
                child: Text(
                  '팀',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/topbar.png',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/topleft.png',
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade400),
                    ),
                    child: TextField(
                      onSubmitted: (msg) {
                        if(msg.isNotEmpty) {
                          ref.read(chatInfoProvider.notifier).sendMessage(msg);
                          _messageController.clear();
                          FocusScope.of(context).requestFocus(_focusNode);
                          //scrollToBottom();
                        }
                      },
                      focusNode: _focusNode,
                      controller: _messageController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.3, horizontal: 5.0),
                        border: InputBorder.none,
                        hintText: '내용을 입력하세요',
                        suffix: GestureDetector(
                          onTap: () {
                            ref.read(chatInfoProvider.notifier).sendMessage(_messageController.text);
                            _messageController.clear();
                            FocusScope.of(context).requestFocus(_focusNode);
                            //scrollToBottom();
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey.shade400,
                            size: 18,
                          ),
                        ),
                        isDense: true,
                      ),
                      cursorColor: Colors.black.withOpacity(0.8),
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 13
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          lockImage.tabIndex == -1 ? showLockImage(lockImage) : const ChatTab(),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.arrow_left,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ChatSheet(
                    name: "Sheet1",
                    onPressed: () {
                      ref.read(lockImageProvider.notifier).updateTabIndex(-1);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myInfo.nameMap == null ? 0 : myInfo.nameMap!.length,
                      itemBuilder: (context, index) {
                        return ChatSheet(
                          name: myInfo.nameMap!.values.elementAt(index),
                          onPressed: () {
                            ref.read(lockImageProvider.notifier).updateTabIndex(index);
                            ref.read(lockImageProvider.notifier).updateBeforeTabIndex(index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFF217346),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text(
                      '준비',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/underbar.png',
              ),
            ],
          ),
        ],
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

  showLockImage(LockImage lockImage) {
    final List<int> codeUnits = lockImage.binary.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return Expanded(
      // child: Image.network(lockImage.url),
      child: KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyUpEvent) {
            if (event.logicalKey == LogicalKeyboardKey.escape) {
              ref.read(lockImageProvider.notifier).updateTabIndex(ref.read(lockImageProvider.notifier).getBeforeTabIndex());
            }
          }
        },
        child: lockImage.binary == ''
            ? Image.asset(
          'assets/images/screenshot.png',
          fit: BoxFit.fitHeight,
        )
            : Image.memory(
          unit8List,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  // showRoom(AsyncValue<ChatInfo> info) {
  //   return Expanded(
  //     child: Padding(
  //       padding: const EdgeInsets.only(top: 5),
  //       child: CustomPaint(
  //         painter: GridBackgroundPainter(),
  //         child: RawKeyboardListener(
  //           focusNode: FocusNode(),
  //           autofocus: true,
  //           onKey: (RawKeyEvent event) {
  //             if (event is RawKeyUpEvent && event.data is RawKeyEventDataWeb) {
  //               final data = event.data as RawKeyEventDataWeb;
  //               if (data.code == 'Escape') {
  //                 setState(() {
  //                   selectTabIndex = TAB_LOCK;
  //                 });
  //               }
  //             }
  //           },
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: ScrollConfiguration(
  //               behavior: ScrollBehavior().copyWith(scrollbars: false),
  //               child: switch(info) {
  //                 AsyncData(:final value) => ListView.builder(
  //                     controller: _scrollController,
  //                     itemCount: value.messages.length,
  //                   itemBuilder: (context, index) => MessageWidget(
  //                       nick: value.messages[index].nick,
  //                       date: value.messages[index].date,
  //                       message: value.messages[index].msg,
  //                       mine: value.messages[index].nick == ref.read(myInfoProvider.notifier).getNick(),
  //                     ),
  //                   ),
  //                 AsyncError(:final error) => ListView.builder(
  //                   controller: _scrollController,
  //                   itemCount: messageList.length,
  //                   itemBuilder: (context, index) => messageList[index],
  //                 ),
  //                 _ => ListView.builder(
  //                   controller: _scrollController,
  //                   itemCount: messageList.length,
  //                   itemBuilder: (context, index) => messageList[index],
  //                 ),
  //               },
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
