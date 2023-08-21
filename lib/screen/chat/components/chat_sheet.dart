import 'package:flutter/material.dart';

class ChatSheet extends StatelessWidget {
  String name;

  ChatSheet({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: const BorderSide(
              width: 1,
              color: Colors.white,
            ),
            left: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            right: BorderSide(
              width: 1,
              color: Colors.grey.shade400,
            ),
            bottom: const BorderSide(
              width: 2,
              color: Color(0xFF217346),
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              '$name',
              style: const TextStyle(
                color: Color(0xFF217346),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
