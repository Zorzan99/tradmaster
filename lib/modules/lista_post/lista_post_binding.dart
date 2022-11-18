import 'package:get/get.dart';

import '../../api/get_posts/repository/get_posts_repository_impl.dart';
import '../../api/get_posts/service/get_posts_service_impl.dart';
import 'lista_post_controller.dart';

class ListaPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetPostsRepositoryImpl());
    Get.lazyPut(() => GetPostsServiceImpl(getPostsRepositoryImpl: Get.find()));
    Get.lazyPut(() => ListaPostController(getPostsServiceImpl: Get.find()));
  }
}
