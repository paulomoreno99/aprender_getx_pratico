// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aprender_getx_pratico/app/data/repositories/models/githu_user_model.dart';
import 'package:dio/dio.dart';

class GithubRepository {
  final Dio dio;

  GithubRepository({required this.dio,});

  Future<List<GithubUserModel>> getGithubUsers() async {
    final result = await dio.get('http://api.github.com/users');

    final List<GithubUserModel> users = [];

    if (result.statusCode == 200) {
      result.data.map((item) => users.add(GithubUserModel.fromMap(item))).toList();
    }

    return users;
  }

  Future<GithubUserModel> getGithubUser ({required String username}) async {
    final result = await dio.get('http://api.github.com/users/$username');

    late GithubUserModel githubUser;

    if (result.statusCode == 200) {
      githubUser = GithubUserModel.fromMap(result.data);
    }

    return githubUser;
  }

}
