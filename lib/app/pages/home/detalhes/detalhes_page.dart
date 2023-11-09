// ignore_for_file: prefer_const_constructors, unused_element

import 'package:aprender_getx_pratico/app/data/repositories/github_repository.dart';
import 'package:aprender_getx_pratico/app/pages/home/detalhes/detalhes_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesPage extends StatefulWidget {
  final String username;


  const DetalhesPage({super.key, required this.username});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {

  late final DetalhesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DetalhesController(repository: GithubRepository(dio: Dio(),),);
    _controller.getGithubUser(username: widget.username);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes Page")),
        body: Obx(() {
          return _controller.isLoading.value
          ? Center(
            child: CircularProgressIndicator())
          : _controller.githubUser == null
          ? Center
          (child: Text("Usuario não encontrado"),
          )
          : _buildUserInfo();
        }),
    );
}

Widget _buildUserInfo() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      children:  [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            _controller.githubUser!.avatarUrl,
            height: 25,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
        ),
        const SizedBox(height: 32),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.emoji_people_rounded,
            color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Nome',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.name ?? 'Sem Informação',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.short_text_rounded,
            color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Login',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.login,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.grain_outlined,
            color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Repositorios Publicos',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.publicRepos.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.people_rounded,
            color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Seguidores',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.followers.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.flag_rounded,
            color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Local',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _controller.githubUser!.location ?? 'Sem Informações',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
                  

        
      ],
    ),
    
  );
}

}