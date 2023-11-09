// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aprender_getx_pratico/app/data/repositories/models/githu_user_model.dart';
import 'package:get/get.dart';
import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';

class HomeController extends GetxController {
  final GithubRepository repository;

  final List<GithubUserModel> _users = <GithubUserModel>[].obs;
  List<GithubUserModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomeController({required this.repository});

  getGithubUsers() async {
    isLoading.value = true;

    final response = await repository.getGithubUsers();

    _users.addAll(response);

    isLoading.value = false;
  }
}
