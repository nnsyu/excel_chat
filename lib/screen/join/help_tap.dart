import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpTap extends StatelessWidget {
  const HelpTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("도움말", style: TextStyle(
              color: Colors.black, fontSize: 40,
              fontWeight: FontWeight.w100,
            ),),
            SizedBox(height: 30,),
          ],
        )
    );
  }
}
