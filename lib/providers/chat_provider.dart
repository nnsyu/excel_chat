// import 'package:excel_chat/providers/model/chat_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class ChatInfoNotifier extends AsyncNotifier<ChatInfo> {
//   Future<ChatInfo> _fetchChatInfo(Map<String, dynamic> json) async {
//     return ChatInfo.fromJson(json);
//   }
//
//   @override
//   ChatInfo build() {
//     return _fetchChatInfo(json)
//   }
//
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