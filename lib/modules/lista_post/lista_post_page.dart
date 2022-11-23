import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademaster/modules/lista_post/components/card_posts.dart';
import 'package:trademaster/modules/lista_post/components/pesquisa.dart';

import '../../models/model_get_posts/my_children.dart';
import 'lista_post_controller.dart';

class ListaPostPage extends GetView<ListaPostController> {
  const ListaPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de posts'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Filtrar',
                    content: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SizedBox(
                            child: Obx(() => CheckboxListTile(
                                title: const Text('Todos'),
                                value: controller.checkBoolTodos.value,
                                activeColor: Colors.blueGrey,
                                onChanged: (value) {
                                  controller.checkBoolTodos.value =
                                      !controller.checkBoolTodos.value;
                                  if (controller.checkBoolTodos.value == true) {
                                    controller.checkBoolFavoritos.value = false;
                                  }
                                }))),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                            child: Obx(() => CheckboxListTile(
                                title: const Text('Favoritos'),
                                value: controller.checkBoolFavoritos.value,
                                activeColor: Colors.blueGrey,
                                onChanged: (value) {
                                  controller.checkBoolFavoritos.value =
                                      !controller.checkBoolFavoritos.value;
                                  if (controller.checkBoolFavoritos.value ==
                                      true) {
                                    controller.checkBoolTodos.value = false;
                                  }
                                }))),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                      ],
                    ),
                    confirm: TextButton(
                      onPressed: () {
                        controller.filterFavorites();
                        Get.back();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ));
              },
              icon: const Icon(Icons.filter_alt_sharp))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Pesquisa(
                  onChanged: (value) {
                    controller.filterByTheme(value);
                  },
                ),
                controller.obx(
                    (state) {
                      final totalItems = (state?.length ?? 0);
                      return SizedBox(
                        height: Get.height * 0.75,
                        child: ListView.builder(
                          controller: controller.scroll,
                          itemCount: totalItems + 1,
                          itemBuilder: (_, index) {
                            if (index == totalItems) {
                              return Obx(() {
                                return Visibility(
                                  visible: controller.isLoading,
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 20.0),
                                      child: Text(
                                        'Carregando novos posts',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }
                            RxBool favorite = false.obs;
                            final MyChildren item = state![index];

                            if (item.data!.favorito == true) {
                              favorite.value = true;
                            }
                            return Obx(() {
                              return CardPosts(
                                comentario: item.data!.selfText,
                                autor: item.data!.authorFullName,
                                upVotes: item.data!.ups.toString(),
                                downVotes: item.data!.downs.toString(),
                                dataComentario: item.data!.created.toString(),
                                onTap: () {},
                                icon: favorite.value
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                      ),
                                onPressedIcon: () {
                                  favorite.toggle();
                                  item.data!.favorito = favorite.value;
                                  controller.addBanco(item);
                                },
                              );
                            });
                          },
                        ),
                      );
                    },
                    onLoading: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blueGrey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    ),
                    onEmpty: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: Get.width * 0.80,
                              child: const Text(
                                'Lista de posts vazia',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onError: (error) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(
                                child:
                                    Text('Não foi possivel carregar a lista')),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
