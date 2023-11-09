// ignore_for_file: prefer_const_constructors

import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';
import 'package:aprender_getx_pratico/app/pages/home/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State <HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeController _controller;

@override
void initState() {
  super.initState();
  _controller = HomeController(
    repository: GithubRepository(
      dio: Dio(),
      ),
    );
  _controller.getGithubUsers();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Users'),
      ),
      body: Obx(() {
        return _controller.isLoading.value
        ? Center(child:CircularProgressIndicator())
        : _controller.users.isEmpty
        ? Center(
          child: Text('Nenhum usuario encontrado!!'),
        )
        :ListView.builder(
          itemCount: _controller.users.length,
          itemBuilder: (_, index) {
            final item = _controller.users[index];
            return ListTile(
              title: Text(item.login),
            );
          },
        );
        
      }));
  
  }
}