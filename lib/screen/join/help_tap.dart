import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpTap extends StatelessWidget {
  const HelpTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '도움말',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "현대사회에서는 업무와 일상의 스트레스가 점점 더 커져가고 있습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "하지만 우리는 모든 순간을 업무에 흡수되어 지칠 필요 없습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "이제 ExcelChat과 함께라면 업무 중에도 눈치 보지 않고 친한 직원들과 소통할 수 있는 새로운 경험을 만나보실 수 있습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 50,),
            Text(
              "1. 직장에서의 자유로운 대화",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "ExcelChat은 업무 중에도 눈치 보지 않고 친한 동료들과 자유롭게 대화할 수 있는 플랫폼입니다. 회사 내에서 강압적인 분위기를 벗어나 마음껏 소통하며 스트레스를 해소할 수 있습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "이제는 단조로운 일상이 아닌, 웃음과 행복으로 가득한 직장 생활을 만나보세요.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
