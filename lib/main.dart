import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademaster/modules/login/login_binding.dart';
import 'package:trademaster/modules/login/login_page.dart';
import 'package:trademaster/modules/register/register_binding.dart';
import 'package:trademaster/modules/register/register_page.dart';

import 'modules/lista_post/lista_post_binding.dart';
import 'modules/lista_post/lista_post_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trademaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: '/list',
          page: () => const ListaPostPage(),
          binding: ListaPostBinding(),
        ),
      ],
    );
  }
}
