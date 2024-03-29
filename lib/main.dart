import 'package:excel_chat/providers/chat_provider.dart';
import 'package:excel_chat/providers/lock_image_provider.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/my_info.dart';
import 'package:excel_chat/screen/chat/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'define/routes.dart';
import 'firebase_options.dart';

final lockImageProvider = NotifierProvider<LockImageNotifier, LockImage>(() {
  return LockImageNotifier();
});

final myInfoProvider = NotifierProvider<MyInfoNotifier, MyInfo>((){
  return MyInfoNotifier();
});

final chatInfoProvider = AsyncNotifierProvider<ChatInfoNotifier, ChatInfo>((){
  return ChatInfoNotifier();
});

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('ko_KR', null);
  runApp(ProviderScope(child: MyApp()));
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
