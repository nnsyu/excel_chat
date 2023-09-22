import 'dart:math';

import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/model/user_info.dart';
import 'package:excel_chat/service/firebase_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTab extends ConsumerStatefulWidget {
  const CreateTab({super.key});

  @override
  ConsumerState<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends ConsumerState<CreateTab> {
  late TextEditingController _inputNickController;
  late TextEditingController _inputNameController;

  String generateRandomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  // void createRoom(String nick, String name) async {
  //   print('닉네임 : $nick, 방이름 : $name');
  //   //todo : 방을 새로 만든다.
  //   DatabaseReference ref = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);
  //
  //   final date = DateTime.now();
  //   final formatDate = '${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0',)}';
  //   final userInfo = UserInfo(
  //     nick: nick,
  //     date: formatDate,
  //     msg: '$nick님이 참여하였습니다.',
  //   );
  //
  //   final roomCode = generateRandomString();
  //
  //   var chatInfo = ChatInfo(
  //     roomCode: roomCode,
  //     roomName: name,
  //     users: [nick],
  //     messages: [userInfo],
  //   );
  //
  //   await ref.child(roomCode).update(chatInfo.toJson());
  //   // Navigator.pop(context);
  // }

  @override
  void initState() {
    super.initState();
    _inputNickController = TextEditingController();
    _inputNameController = TextEditingController();
  }

  @override
  void dispose() {
    _inputNickController.dispose();
    _inputNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myInfo = ref.watch(myInfoProvider);

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "방 만들기",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w100,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.8,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: TextField(
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.4),
              ),
              controller: _inputNickController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: '닉네임을 입력하세요',
                suffix: GestureDetector(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.grey.shade200,
                    size: 18,
                  ),
                ),
                isDense: true,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.8,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: TextField(
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.4),
              ),
              controller: _inputNameController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: '방 이름을 입력하세요',
                suffix: GestureDetector(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.grey.shade200,
                    size: 18,
                  ),
                ),
                isDense: true,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "방 | 코드를 | 입력 후 | 아래 | \n참여하기 | 이미지를 | 누르면 | 입장합니다.",
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[500],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            ref.read(chatInfoProvider.notifier).createRoom(
              _inputNickController.text,
              _inputNameController.text,
            );

            Navigator.popAndPushNamed(context, '/');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade400,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '방 만들기',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
