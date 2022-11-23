import 'package:get/get.dart';
import 'package:trademaster/models/model_get_posts/my_children.dart';
import '../../api/get_posts/service/get_posts_service_impl.dart';
import '../../database/database_sqlite.dart';

class ListaPostController extends GetxController
    with StateMixin<List<MyChildren>>, ScrollMixin {
  final checkBoolTodos = true.obs;
  final checkBoolFavoritos = false.obs;
  List<MyChildren> listPosts = <MyChildren>[].obs;
  var _listPostsOriginal = <MyChildren>[];
  late final Worker workerPage;
  final _page = 1.obs;
  final _limit = 10;
  final _loading = false.obs;
  bool get isLoading => _loading.value;
  // ignore: prefer_typing_uninitialized_variables
  var dataBase;
  final GetPostsServiceImpl _getPostsServiceImpl;
  ListaPostController({required GetPostsServiceImpl getPostsServiceImpl})
      : _getPostsServiceImpl = getPostsServiceImpl;
  @override
  void onInit() async {
    super.onInit();
    workerPage = ever<int>(_page, (_) {
      findListPost();
    });
    dataBase = await DatabaseSqlite().openConnection();
  }

  @override
  void onReady() {
    findListPost();
    super.onReady();
  }

  @override
  void onClose() {
    workerPage();
  }

  @override
  Future<void> onTopScroll() async {}

  @override
  Future<void> onEndScroll() async {
    if (!isLoading) {
      _page.value++;
    }
  }

  Future<void> findListPost() async {
    //change([], status: RxStatus.loading());
    _loading(true);
    try {
      final dados = await _getPostsServiceImpl.getPosts(_limit, _page.value);
      listPosts = state ?? [];
      for (var element in dados.data.children) {
        final idApi = element.data!.idApi;
        final verificaId = await dataBase
            .rawQuery('select id_api from posts  where id_api = ?', [idApi]);
        if (verificaId.length == 1) {
          element.data!.favorito = true;
        } else {
          element.data!.favorito = false;
        }
      }
      listPosts.addAll(dados.data.children);
      _listPostsOriginal = listPosts;
      if (dados.data.children.isEmpty) {
        change([], status: RxStatus.empty());
        _loading(false);
      } else {
        change(listPosts, status: RxStatus.success());
        _loading(false);
      }
    } catch (e) {
      change([], status: RxStatus.error());
      _loading(false);
    }
    _loading(false);
  }

  void filterByTheme(String theme) {
    if (theme.isNotEmpty) {
      if (theme.length >= 2) {
        var newlistPosts = <MyChildren>[];
        for (var item in listPosts) {
          if (item.data!.selfText
              .toLowerCase()
              .contains(theme.toLowerCase())) {
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

  void filterFavorites() {
    if (checkBoolTodos.value == true) {
      change(_listPostsOriginal, status: RxStatus.success());
    } else {
      var newlistPosts = <MyChildren>[];
      for (var item in listPosts) {
        if (item.data!.favorito == true) {
          newlistPosts.add(item);
        }
      }
      if (newlistPosts.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(newlistPosts, status: RxStatus.success());
      }
    }
  }

  Future<void> addBanco(MyChildren item) async {
    final idApi = item.data!.idApi;
    final verificaId = await dataBase
        .rawQuery('select id_api from posts  where id_api = ?', [idApi]);
    if (item.data!.favorito == true) {
      await dataBase.rawInsert(
          'INSERT INTO posts(selfText, authorFullName, created, ups, downs, favorito, id_api) VALUES("${item.data!.selfText}", "${item.data!.authorFullName}", "${item.data!.created}", "${item.data!.ups}", "${item.data!.downs}","${item.data!.favorito}","${item.data!.idApi}")');
    } else {
      if (verificaId.length == 1) {
        dataBase.rawDelete('delete from posts where id_api = ?', [idApi]);
      }
    }
  }
}
