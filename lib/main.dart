import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/lista_post/lista_post_binding.dart';
import 'modules/lista_post/lista_post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      getPages: [
        GetPage(
            name: '/',
            page: () => const ListaPostPage(),
            binding: ListaPostBinding())
      ],
    );
  }
}
