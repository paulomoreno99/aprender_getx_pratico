import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';
import 'package:aprender_getx_pratico/app/pages/home/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

setUpHome() {
  Get.put(
    HomeController(
      repository: GithubRepository(
        dio: Dio(),
      ),
    ),
  );
}
