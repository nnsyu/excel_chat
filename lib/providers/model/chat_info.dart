import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_info.freezed.dart';
part 'chat_info.g.dart';

@immutable
@freezed
class ChatInfo with _$ChatInfo {
  factory ChatInfo({
    required String roomName,
    required String roomCode,
    required List<String> users,
    required List<String> messages,
}) = _ChatInfo;

  factory ChatInfo.fromJson(Map<String, dynamic> json) => _$ChatInfoFromJson(json);
}

