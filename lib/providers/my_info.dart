import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class MyInfo {
  final String nick;
  final String code;
  final Map<String, String>? nameMap;

  const MyInfo({
    this.nick = '',
    this.code = '',
    this.nameMap,
  });

  MyInfo copyWith({String? nick, String? code, Map<String, String>? nameMap}) {
    return MyInfo(
      nick: nick ?? this.nick,
      code: code ?? this.code,
      nameMap: nameMap ?? this.nameMap,
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

  void updateCodeList(String code, String name) {
    Map<String, String>? updateMap = {};
    state.nameMap == null ? updateMap[code] = name : updateMap.addAll(state.nameMap!);
    updateMap[code] = name;

    state = state.copyWith(nameMap: updateMap);
  }

  String getNick() {
    return state.nick;
  }

  String getCode() {
    return state.code;
  }

  Map<String, String>? getCodeList() {
    return state.nameMap ?? {};
  }
}

