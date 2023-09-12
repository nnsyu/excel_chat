import 'package:excel_chat/service/firebase_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  late TextEditingController _inputNickController;
  late TextEditingController _inputNameController;

  void createRoom(String nick, String name) async {
    print('닉네임 : $nick, 방이름 : $name');
    //todo : 방을 새로 만든다.
    DatabaseReference ref = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);

    await ref.push().set({
    // "name": "John",
    // "age": 18,
    // "address": {
    //   "line1": "100 Mountain View"
    // }
    });
  }

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
          onTap: () => createRoom(
            _inputNickController.text,
            _inputNameController.text,
          ),
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
