import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/github.dart';

part 'github_service.g.dart';

@RestApi(baseUrl: "https://api.github.com/")
abstract class GithubService {
  factory GithubService(Dio dio, {String baseUrl}) = _GithubService;

  @GET("/users")
  Future<List<Github>> getUsers();
}
