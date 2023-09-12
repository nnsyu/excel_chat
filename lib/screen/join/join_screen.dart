import 'package:excel_chat/screen/join/tab/create_tab.dart';
import 'package:excel_chat/screen/join/tab/help_tab.dart';
import 'package:excel_chat/screen/join/tab/join_tab.dart';
import 'package:excel_chat/screen/join/tab/setting_tab.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {

  final TAP_JOIN = 0;
  final TAP_CREATE = 1;
  final TAP_HELP = 2;
  final TAP_SETTING = 3;

  int _selectTap = 0;

  @override
  void initState() {
    super.initState();
    _selectTap = TAP_JOIN;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              color: const Color(0xFF217346),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.arrow_back,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectTap = TAP_JOIN;
                        });
                      },
                      child: const Text(
                        "방 참여하기",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    // MenuText(
                    //   icon: Icons.add_comment_outlined,
                    //   name: '방 만들기',
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectTap = TAP_CREATE;
                        });
                      },
                      child: const Text(
                        "방 만들기",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "방 나가기",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectTap = TAP_SETTING;
                        });
                      },
                      child: const Text(
                        "설정   ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectTap = TAP_HELP;
                        });
                      },
                      child: const Text(
                        "도움말",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: selectTap(),
            ),
          )
        ],
      ),
    );
  }

  Widget selectTap() {
    if(_selectTap == TAP_JOIN) {
      return JoinTab();
    } else if (_selectTap == TAP_CREATE) {
      return CreateTab();
    } else if (_selectTap == TAP_SETTING){
      return SettingTab();
    } else {
      return HelpTab();
    }
  }
}

class MenuText extends StatelessWidget {
  String name;
  IconData icon;

  MenuText({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$name',
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
