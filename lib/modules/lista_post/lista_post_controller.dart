import 'package:get/get.dart';
import 'package:trademaster/models/model_get_posts/my_children.dart';

import '../../api/get_posts/service/get_posts_service_impl.dart';

class ListaPostController extends GetxController
    with StateMixin<List<MyChildren>> {
  final listPosts = <MyChildren>[].obs;
  var _listPostsOriginal = <MyChildren>[];
  final GetPostsServiceImpl _getPostsServiceImpl;
  ListaPostController({required GetPostsServiceImpl getPostsServiceImpl})
      : _getPostsServiceImpl = getPostsServiceImpl;
  @override
  void onInit() async {
    super.onInit();
    findListPost();
  }

  Future<void> findListPost() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _getPostsServiceImpl.getPosts(10);
      listPosts.assignAll(dados.data.children);
      _listPostsOriginal = listPosts;
      if (dados.data.children.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(dados.data.children, status: RxStatus.success());
      }
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  void filterByTheme(String documentoDigitado) {
    if (documentoDigitado.isNotEmpty) {
      // print(documentoDigitado);
      if (documentoDigitado.length >= 2) {
        var newlistPosts = <MyChildren>[];
        for (var item in listPosts) {
          if (item.data!.selfText
              .toLowerCase()
              .contains(documentoDigitado.toLowerCase())) {
            newlistPosts.add(item);
          }
        }
        if (newlistPosts.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(newlistPosts, status: RxStatus.success());
        }
      } else {
        change(_listPostsOriginal, status: RxStatus.success());
      }
    }
  }
}
