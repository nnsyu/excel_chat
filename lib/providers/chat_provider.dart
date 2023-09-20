import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/my_info.dart';
import 'package:excel_chat/service/firebase_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatInfoNotifier extends AsyncNotifier<ChatInfo> {

  Future<ChatInfo> _fetchChatInfo(String code) async {

    final chatRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);
    final snapshot = await chatRef.child('users/${ref.read(myInfoProvider).code}').get();
    if (snapshot.exists) {
      final json = snapshot.value as Map<String, dynamic>;
      return ChatInfo.fromJson(json);
    } else {
      print('No data available.');
      return ChatInfo(roomName: '', users: [], messages: []);
    }
  }

  @override
  Future<ChatInfo> build() async {
    return _fetchChatInfo(ref.read(myInfoProvider).code);
  }
}

// class LockImageNotifier extends Notifier<LockImage> {
//
//   @override
//   LockImage build() {
//     return const LockImage();
//   }
//
//   void updateUrl(String url) {
//     state = LockImage(url: url);
//   }
//
//   String getUrl() {
//     return state.url;
//   }
// }