import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class LockImage {
  final String url;
  final String binary;
  final bool isChange;
  final int tabIndex;
  final int beforeTabIndex;

  const LockImage({
    this.url = "",
    this.binary = "",
    this.isChange = false,
    this.tabIndex = -1,
    this.beforeTabIndex = -1,
  });

  LockImage copyWith({String? url, String? binary, bool? isChange, int? tabIndex, int? beforeTabIndex}) {
    return LockImage(
      url: url ?? this.url,
      binary: binary ?? this.binary,
      isChange: isChange ?? this.isChange,
      tabIndex: tabIndex ?? this.tabIndex,
      beforeTabIndex: beforeTabIndex ?? this.beforeTabIndex,
    );
  }
}

class LockImageNotifier extends Notifier<LockImage> {

  @override
  LockImage build() {
    return const LockImage();
  }

  void updateInfo(String url, String binary) {
    state = state.copyWith(url: url, binary: binary);
    //state = LockImage(url: url, binary: binary);
  }

  void updateIsChange(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }

  void updateTabIndex(int tabIndex) {
    state = state.copyWith(tabIndex: tabIndex);
  }

  void updateBeforeTabIndex(int beforeTabIndex) {
    state = state.copyWith(beforeTabIndex: beforeTabIndex);
  }

  String getUrl() {
    return state.url;
  }

  String getBinary() {
    return state.binary;
  }

  bool getIsChange() {
    return state.isChange;
  }

  int getTabIndex() {
    return state.tabIndex;
  }

  int getBeforeTabIndex() {
    return state.beforeTabIndex;
  }
}

