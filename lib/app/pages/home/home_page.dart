// ignore_for_file: prefer_const_constructors

import 'package:aprender_getx_pratico/app/pages/home/detalhes/detalhes_page.dart';
import 'package:aprender_getx_pratico/app/pages/home/home_binding.dart';
import 'package:aprender_getx_pratico/app/pages/home/home_controller.dart';
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
  setUpHome();
  _controller = Get.find<HomeController>();
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
          child: Text('Nenhum usuario encontrado!!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
          ),),
          
        )
        :ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: _controller.users.length,
          itemBuilder: (_, index) {
            final user = _controller.users[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),),
              ),
              title: const Text(
                'usuario',
                style: TextStyle(color: Colors.black54,
                
              ),),
              subtitle: Text(
                user.login,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.to(DetalhesPage(username: user.login));
              },           
                         
            );
          },
        );}
      ),
      );
   
  }
}