import 'package:excel_chat/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';

import 'define/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: route,
    );
  }
}
