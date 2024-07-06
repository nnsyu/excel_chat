import 'dart:convert';
import 'dart:math';

import 'package:excel_chat/main.dart';
import 'package:excel_chat/providers/model/chat_info.dart';
import 'package:excel_chat/providers/model/user_info.dart';
import 'package:excel_chat/providers/my_info.dart';
import 'package:excel_chat/service/firebase_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatInfoNotifier extends AsyncNotifier<ChatInfo> {

  Future<ChatInfo> fetchChatInfo(String code) async {

    final chatRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);
    //final snapshot = await chatRef.child(ref.read(myInfoProvider).code).get();
    final snapshot = await chatRef.child(code).get();
    if (snapshot.exists) {
      final json = snapshot.value as Map<String, dynamic>;
      // print('_fetchChatInfo $json');
      return ChatInfo.fromJson(json);
    } else {
      print('No data available.');
      return ChatInfo(roomCode: '', roomName: '', users: [], messages: []);
    }
  }

  @override
  Future<ChatInfo> build() async {
    return fetchChatInfo(ref.read(myInfoProvider).code);
  }

  Future<void> createRoom(String nick, String name) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      print('닉네임 : $nick, 방이름 : $name');
      //todo : 방을 새로 만든다.
      DatabaseReference chatRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);

      final date = DateTime.now();
      final month = date.month.toString().padLeft(2, '0');
      final day = date.day.toString().padLeft(2, '0');
      final hour = date.hour.toString().padLeft(2, '0');
      final minute = date.minute.toString().padLeft(2, '0',);
      final formatDate = '$month-$day $hour:$minute';

      final userInfo = UserInfo(
        nick: nick,
        date: formatDate,
        msg: '$nick님이 참여하였습니다.',
      );

      final roomCode = generateRandomString();

      var chatInfo = ChatInfo(
        roomCode: roomCode,
        roomName: name,
        users: [nick],
        messages: [userInfo],
      );

      await chatRef.child(roomCode).update(chatInfo.toJson());

      ref.read(myInfoProvider.notifier).updateNick(nick);
      ref.read(myInfoProvider.notifier).updateCode(roomCode);
      ref.read(myInfoProvider.notifier).updateCodeList(roomCode, name);

      //listenRoom(roomCode);

      return fetchChatInfo(roomCode);
    });
  }

  Future<void> sendMessage(String msg) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
        DateTime currentTime = DateTime.now()..toLocal();
        var formatter = DateFormat('MM-dd HH:mm', 'ko_KR');
        String strDate = formatter.format(currentTime);

        final roomCode = ref.read(myInfoProvider.notifier).getCode();
        DatabaseReference messageRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef).child(roomCode).child('messages');
        final snapShot = await messageRef.get();

        if(snapShot.exists) {
            final value = snapShot.value as List<dynamic>;
            List<UserInfo> userInfoList = value.map((v) => UserInfo.fromJson(v as Map<String, dynamic>)).toList();
            userInfoList.add(UserInfo(nick: ref.read(myInfoProvider.notifier).getNick(), date: strDate, msg: msg));

            List<Map<String, dynamic>> json = userInfoList.map((userInfo) => userInfo.toJson()).toList();

            final Map<String, List<Map>> updates = {};
            updates['${FirebaseManager.chatRef}/$roomCode/messages'] = json;
            FirebaseDatabase.instance.ref().update(updates);
        } else {
          print('sendMessage 뭐지');
        }

      return fetchChatInfo(roomCode);
    });
  }

  // Future<void> listenRoom(String code) async {
  //
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     DatabaseReference messageRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef).child(code).child('messages');
  //     messageRef.onValue.listen((event) {
  //       print('바꼈다');
  //       build();
  //     });
  //     return _fetchChatInfo(code);
  //   });
  // }

  Future<ChatInfo?> isExistRoom(String nick, String code) async {
    DatabaseReference chatRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);

    final event = await chatRef.once(DatabaseEventType.value);
    // final snapshot = await chatRef.get();
    print('isExistRoom event $event');

    final data = event.snapshot.value as Map<String, dynamic>;
    print('isExistRoom data $data');

    for(var key in data.keys) {
      if(key == code) {
        return ChatInfo.fromJson(data[key]);
      }
    }

    return null;
  }

  Future<void> joinRoom(String nick, ChatInfo chat) async {
    print('joinRoom $chat');
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final date = DateTime.now();
        final month = date.month.toString().padLeft(2, '0');
        final day = date.day.toString().padLeft(2, '0');
        final hour = date.hour.toString().padLeft(2, '0');
        final minute = date.minute.toString().padLeft(2, '0',);
        final formatDate = '$month-$day $hour:$minute';

        final userInfo = UserInfo(
          nick: nick,
          date: formatDate,
          msg: '$nick님이 참여하였습니다.',
        );

        // 수정 가능한 리스트로 복사 후 추가
        final updatedUsers = List<String>.from(chat.users)..add(nick);
        final updatedMessages = List<UserInfo>.from(chat.messages)..add(userInfo);

        //print('joinRoom $userInfo');

        // copyWith 메서드를 사용하여 새로운 ChatInfo 객체 생성
        final chatInfo = chat.copyWith(
          users: updatedUsers,
          messages: updatedMessages,
        );

        // chat.users.add(nick);
        // chat.messages.add(userInfo);

        //print('joinRoom $chat');

        DatabaseReference chatRef = FirebaseDatabase.instance.ref(FirebaseManager.chatRef);
        await chatRef.child(chatInfo.roomCode).update(chatInfo.toJson());

        ref.read(myInfoProvider.notifier).updateNick(nick);
        ref.read(myInfoProvider.notifier).updateCode(chatInfo.roomCode);
        ref.read(myInfoProvider.notifier).updateCodeList(chatInfo.roomCode, chatInfo.roomName);

        return fetchChatInfo(chatInfo.roomCode);
      } catch (e, stacktrace) {
        print('joinRoom 예외 발생: $e');
        print('joinRoom 스택 트레이스: $stacktrace');
        rethrow;
      }
    });
  }

  DatabaseReference listenMessages(String code) {
    return FirebaseDatabase.instance.ref(FirebaseManager.chatRef).child(code).child('messages');
  }


  String generateRandomString() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}