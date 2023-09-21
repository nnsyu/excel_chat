import 'package:excel_chat/providers/model/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_info.freezed.dart';
part 'chat_info.g.dart';

@immutable
@freezed
class ChatInfo with _$ChatInfo {
  factory ChatInfo({
    required String roomCode,
    required String roomName,
    required List<String> users,
    @JsonKey(fromJson: _userInfoFromJson, toJson: _userInfoToJson)
    required List<UserInfo> messages,
}) = _ChatInfo;

  factory ChatInfo.fromJson(Map<String, dynamic> json) => _$ChatInfoFromJson(json);
}

List<UserInfo> _userInfoFromJson(List<dynamic> json) =>
json.map((item) => UserInfo.fromJson(item as Map<String, dynamic>)).toList();

List<dynamic> _userInfoToJson(List<UserInfo> messages) =>
messages.map((item) => item.toJson()).toList();


