import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class LockImage {
  final String url;
  final String binary;
  final bool isChange;

  const LockImage({
    this.url = "",
    this.binary = "",
    this.isChange = false,
  });

  LockImage copyWith({String? url, String? binary, bool? isChange}) {
    return LockImage(
      url: url ?? this.url,
      binary: binary ?? this.binary,
      isChange: isChange ?? this.isChange,
    );
  }
}

class LockImageNotifier extends Notifier<LockImage> {

  @override
  LockImage build() {
    return const LockImage();
  }

  void updateInfo(String url, String binary) {
    state = LockImage(url: url, binary: binary);
  }

  void updateIsChange(bool isChange) {
    state = LockImage(isChange: isChange);
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
}

