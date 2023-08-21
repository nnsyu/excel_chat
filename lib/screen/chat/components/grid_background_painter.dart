import 'package:flutter/material.dart';

class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 격자 선의 스타일 설정
    final paintStyle = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1.0;

    // 가로 선 그리기
    for (int i = 0; i <= size.height.toInt(); i += 20) {
      canvas.drawLine(Offset(0, i.toDouble()), Offset(size.width, i.toDouble()), paintStyle);
    }

    // 세로 선 그리기
    for (int i = 0; i <= size.width.toInt(); i += 70) {
      canvas.drawLine(Offset(i.toDouble(), 0), Offset(i.toDouble(), size.height), paintStyle);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}