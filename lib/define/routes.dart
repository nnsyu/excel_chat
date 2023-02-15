import 'package:excel_chat/screen/chat/chat_screen.dart';
import 'package:excel_chat/screen/join/join_screen.dart';
import 'package:flutter/cupertino.dart';

final route = {
  '/' : (BuildContext context) => const ChatScreen(),
  '/join' : (BuildContext context) => const JoinScreen(),
};