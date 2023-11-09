import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';
import 'package:aprender_getx_pratico/app/pages/home/detalhes/detalhes_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

setUpDetalhes() {
  Get.put(DetalhesController(
      repository: GithubRepository(
    dio: Dio(),
  )));
}
