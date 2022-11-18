import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lista_post_controller.dart';

class ListaPostPage extends GetView<ListaPostController> {
  const ListaPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
      ),
      body: Container(
        child: Text(controller.teste),
      ),
    );
  }
}
