import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';
import 'package:aprender_getx_pratico/app/data/repositories/models/githu_user_model.dart';
import 'package:get/get.dart';

class DetalhesController extends GetxController {
  final GithubRepository repository;

  GithubUserModel? _githubUser;
  GithubUserModel? get githubUser => _githubUser;

 final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  DetalhesController({required this.repository});

  getGithubUser({required String username}) async {
    _isLoading.value = true;

    final result = await repository.getGithubUser(username: username);
    _githubUser = result;

    _isLoading.value  = false;
  }




  
}