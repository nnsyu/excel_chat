import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MyInfo {
  final String nick;
  final String code;

  const MyInfo({
    this.nick = '',
    this.code = '',
  });

  MyInfo copyWith({String? nick, String? code}) {
    return MyInfo(
      nick: nick ?? this.nick,
      code: code ?? this.code,
    );
  }
}

class MyInfoNotifier extends Notifier<MyInfo> {

  @override
  MyInfo build() {
    return const MyInfo();
  }

  void updateInfo(String nick, String code) {
    // state = state.copyWith(url: url, binary: binary);
    state = MyInfo(nick: nick, code: code);
  }

  void updateNick(String nick) {
    state = state.copyWith(nick: nick);
  }

  void updateCode(String code) {
    state = state.copyWith(code: code);
  }

  String getNick() {
    return state.nick;
  }

  String getCode() {
    return state.code;
  }
}

