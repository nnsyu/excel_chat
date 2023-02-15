import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String title = '엑셀제목제목';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  child: Text(
                    '$title.xlsx - Excel',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 12.5,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.center,
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
            height: 10,
          ),
          Row(
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
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: '내용을 입력하세요',
                      suffix: Icon(
                        Icons.arrow_forward,
                        size: 18,
                      ),
                    ),
                    cursorColor: Colors.black.withOpacity(0.8),
                    autofocus: true,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(),
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
}
