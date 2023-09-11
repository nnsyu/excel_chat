import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String content;
  final bool isHeader;

  const InfoText({super.key, this.isHeader = false, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: isHeader ? 50 : 10,
        ),
        Text(
          content,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: isHeader ? 18 : 16,
            fontWeight: isHeader ? FontWeight.w600 : FontWeight.normal
          ),
        ),
      ],
    );
  }
}
