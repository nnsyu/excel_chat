import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTab> {
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
              '설정',
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
              "잠금이미지 설정",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(''),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7),
                      child: Text(
                        '이미지 불러오기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     decoration: BoxDecoration(
                //       border: Border(
                //         top: BorderSide(
                //           width: 1,
                //           color: Colors.grey.shade400,
                //         ),
                //         left: BorderSide(
                //           width: 1,
                //           color: Colors.grey.shade400,
                //         ),
                //         right: BorderSide(
                //           width: 1,
                //           color: Colors.grey.shade400,
                //         ),
                //         bottom: BorderSide(
                //           width: 1,
                //           color: Colors.grey.shade400,
                //         ),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: EdgeInsets.all(7),
                //       child: Text(
                //         '이미지 불러오기',
                //         style: TextStyle(
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
