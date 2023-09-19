import 'package:excel_chat/providers/model/user_info.dart';
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
    required List<UserInfo> messages,
}) = _ChatInfo;

  factory ChatInfo.fromJson(Map<String, dynamic> json) => _$ChatInfoFromJson(json);

  ChatInfo._();

  // ChatInfo copyWith({String? roomName, String? roomCode, List<String>? users, List<UserInfo>? messages}) {
  //   return ChatInfo(
  //     roomName: roomName ?? this.roomName,
  //     roomCode: roomCode ?? this.roomCode,
  //     users: users ?? this.users,
  //     messages: messages ?? this.messages,
  //   );
  // }
}

