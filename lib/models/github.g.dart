// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Github _$GithubFromJson(Map<String, dynamic> json) => Github(
  login: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
  htmlUrl: json['html_url'] as String,
);

Map<String, dynamic> _$GithubToJson(Github instance) => <String, dynamic>{
  'login': instance.login,
  'avatar_url': instance.avatarUrl,
  'html_url': instance.htmlUrl,
};
