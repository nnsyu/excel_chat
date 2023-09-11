import 'package:excel_chat/screen/join/components/info_text.dart';
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
            SizedBox(
              height: 20,
            ),
            Text(
              "하지만 우리는 모든 순간을 업무에 흡수되어 지칠 필요 없습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "이제 ExcelChat과 함께라면 업무 중에도 눈치 보지 않고 친한 직원들과 소통할 수 있는 새로운 경험을 만나보실 수 있습니다.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            const InfoText(isHeader: true, content: "1. 직장에서의 자유로운 대화"),
            const InfoText(content: "ExcelChat은 업무 중에도 눈치 보지 않고 친한 동료들과 자유롭게 대화할 수 있는 플랫폼입니다. 회사 내에서 강압적인 분위기를 벗어나 마음껏 소통하며 스트레스를 해소할 수 있습니다."),
            const InfoText(content: "이제는 단조로운 일상이 아닌, 웃음과 행복으로 가득한 직장 생활을 만나보세요."),

            const InfoText(isHeader: true, content: "2. 실시간 그룹 채팅 기능"),
            const InfoText(content: "ExcelChat은 그룹 채팅 기능을 제공하여 여러 명과 동시에 대화할 수 있는 환경을 제공합니다. 그룹을 생성하여 원하는 주제에 따라 자유롭게 소통하며 아이디어를 공유할 수 있습니다."),
            const InfoText(content: "이제는 협업의 한계를 넘어 함께 성장하는 동료들과 더욱 가까워질 수 있습니다."),

            const InfoText(isHeader: true, content: "3. 익명성 보장 및 개인 정보 보호"),
            const InfoText(content: "ExcelChat은 익명성을 보장하여 사용자들이 자유롭게 의견을 나눌 수 있는 환경을 조성합니다."),
            const InfoText(content: "개인 정보는 철저하게 관리되며 외부로 유출되지 않으므로 안전하게 서비스를 이용하실 수 있습니다."),

            const InfoText(isHeader: true, content: "4. 일상에서 벗어난 경험"),
            const InfoText(content: "평범한 일상에서 벗어나 심리적으로 안정된 상태에서 친구와 같이 즐거운 시간을 보낼 수 있는 ExcelChat."),
            const InfoText(content: "지금까지 경험하지 못한 즉각적인 반응과 웃음으로 가득 찬 커뮤니케이션의 세계로 초대합니다."),

            const InfoText(isHeader: true, content: "우리 모두가 일상생활에서 벗어나 친구와 함께하는 시간은 귀중합니다"),
            const InfoText(content: "ExcelChat은 현재의 혼란스럽고 바빠진 세계 속에서도 우리가 사랑하는 사람들과 연결될 수 있는 창입니다."),
            const InfoText(content: "더 나은 업무 환경과 함께 따듯하고 유효한 커뮤니케이션 경험이 되길 바라며, 여러분의 많은 관심 부탁드립니다!"),
            const InfoText(isHeader: true, content: "[주의] 본 서비스는 회사 내부 사용자만 사용 가능합니다."),
          ],
        ),
      ),
    );
  }
}
