import 'package:get/get.dart';

import '../../api/get_posts/service/get_posts_service_impl.dart';

class ListaPostController extends GetxController {
  String teste = 'testeeee';
  final GetPostsServiceImpl _getPostsServiceImpl;
  ListaPostController({required GetPostsServiceImpl getPostsServiceImpl})
      : _getPostsServiceImpl = getPostsServiceImpl;
  @override
  void onInit() async {
    super.onInit();
    final teste = await _getPostsServiceImpl.getPosts();
    print(teste);
  }
}
