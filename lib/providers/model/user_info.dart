import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@immutable
@freezed
class UserInfo with _$UserInfo {
  factory UserInfo({
    required String userNick,
    required String sendTime,
    required String sendMsg,
}) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}