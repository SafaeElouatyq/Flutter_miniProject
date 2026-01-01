// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Github _$GithubFromJson(Map<String, dynamic> json) => Github(
  login: json['login'] as String,
  avatarUrl: json['avatarUrl'] as String,
  htmlUrl: json['htmlUrl'] as String,
);

Map<String, dynamic> _$GithubToJson(Github instance) => <String, dynamic>{
  'login': instance.login,
  'avatarUrl': instance.avatarUrl,
  'htmlUrl': instance.htmlUrl,
};
