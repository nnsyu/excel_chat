import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final int rows;
  final int columns;

  GridPainter({required this.rows, required this.columns});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke // 선으로 그립니다.
      ..strokeWidth = 0.7; // 선의 두께를 설정합니다.

    final width = size.width;
    final height = size.height;

    // 가로 방향 라인을 그립니다.
    for (int i = 0; i <= rows; i++) {
      final y = i * height / rows;
      canvas.drawLine(Offset(0, y), Offset(width, y), paint);
    }

    // 세로 방향 라인을 그립니다.
    for (int i = 0; i <= columns; i++) {
      double x = i * width / columns;
      if(i == 1) {
        x -= 35;
      } else {
        x -= 35;
      }
      canvas.drawLine(Offset(x, 0), Offset(x, height), paint);
    }

    // A, B, C, ... 텍스트를 그립니다.
    for (int i = 1; i <= columns; i++) {
      final textSpan = TextSpan(
        text: String.fromCharCode(i + 64),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.5),
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: width);

      double textHeight = textPainter.height;
      textHeight -= 8;

      final x = i * width / columns - textPainter.width / 2;
      textPainter.paint(
          canvas, Offset(x, height / rows - textHeight) - const Offset(0, 10));
    }

    // 1, 2, 3, ... 텍스트를 그립니다.
    for (int i = 1; i <= rows; i++) {
      final textSpan = TextSpan(
        text: i.toString(),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.5),
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: width);

      double textWidth = textPainter.width;
      textWidth += 30;

      double y = i * height / rows - textPainter.height / 2;
      y += 13;

      textPainter.paint(
          canvas, Offset(width / columns - textWidth, y) - const Offset(10, 0));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GridWidget extends StatelessWidget {
  final int rows;
  final int columns;

  GridWidget({required this.rows, required this.columns});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(rows: rows, columns: columns),
    );
  }
}
