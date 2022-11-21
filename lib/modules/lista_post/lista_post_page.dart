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
        title: const Text('Lista'),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_3))],
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
                      return SizedBox(
                        height: Get.height * 0.75,
                        child: ListView.builder(
                          //itemCount: 3,
                          itemCount: state?.length,
                          itemBuilder: (_, index) {
                            RxBool favorite = false.obs;
                            final MyChildren item = state![index];
                            print(item);

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
                                  print(item.data!.favorito);
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
                                'Lista vazia',
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
                            Center(child: Text('Deu ruim')),
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
