import 'package:json_annotation/json_annotation.dart';

part 'github.g.dart';

@JsonSerializable()
class Github {
  final String login;
  final String avatarUrl;
  final String htmlUrl;

  Github({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory Github.fromJson(Map<String, dynamic> json)
  => _$GithubFromJson(json);


}
