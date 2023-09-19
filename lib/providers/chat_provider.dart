// import 'package:excel_chat/main.dart';
// import 'package:excel_chat/providers/model/chat_info.dart';
// import 'package:excel_chat/providers/my_info.dart';
// import 'package:excel_chat/service/firebase_manager.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class ChatInfoNotifier extends AsyncNotifier<List<ChatInfo>> {
//
//   Future<ChatInfo> _fetchChatInfo() async {
//     DatabaseReference chatRef =
//   }
//
//   @override
//   Future<List<ChatInfo>> build() async {
//     return _fetchChatInfo(json)
//   }
//
//   Future<void> createRoom(ChatInfo info) async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       await FirebaseDatabase.instance.ref(FirebaseManager.chatRef).child(info.roomCode).set(info.toJson());
//       return _fetchChatInfo();
//     });
//   }
// }
//
// // class LockImageNotifier extends Notifier<LockImage> {
// //
// //   @override
// //   LockImage build() {
// //     return const LockImage();
// //   }
// //
// //   void updateUrl(String url) {
// //     state = LockImage(url: url);
// //   }
// //
// //   String getUrl() {
// //     return state.url;
// //   }
// // }