import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTap extends StatefulWidget {
  const CreateTap({super.key});
  @override
  State<CreateTap> createState() => _CreateTapState();
}

class _CreateTapState extends State<CreateTap> {
  late TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
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
              controller: _inputController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: '방 코드를 입력하세요',
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
        SizedBox(height: 30,),
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
              bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade400,
              ),
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
      ],
    ));
  }
}
