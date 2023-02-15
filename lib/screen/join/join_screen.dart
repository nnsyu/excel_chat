import 'package:flutter/material.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                color: const Color(0xFF217346),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      MenuText(
                        icon: Icons.access_time,
                        name: '메뉴1',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuText(
                        icon: Icons.ac_unit_rounded,
                        name: '메뉴2',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuText(
                        icon: Icons.class_sharp,
                        name: '메뉴3',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 9,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '$name',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
