import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class LockImage {
  final String url;

  const LockImage({
    this.url = "",
  });

  LockImage copyWith({String? url}) {
    return LockImage(
      url: url ?? this.url,
    );
  }
}

class LockImageNotifier extends Notifier<LockImage> {

  @override
  LockImage build() {
    return const LockImage();
  }

  void updateUrl(String url) {
    state = LockImage(url: url);
  }

  String getUrl() {
    return state.url;
  }
}

