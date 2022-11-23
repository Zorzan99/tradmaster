import 'package:trademaster/models/model_get_posts/model_pai.dart';

import '../repository/get_posts_repository_impl.dart';
import 'get_posts_service.dart';

class GetPostsServiceImpl implements GetPostsService {
  final GetPostsRepositoryImpl _getPostsRepositoryImpl;
  GetPostsServiceImpl({required GetPostsRepositoryImpl getPostsRepositoryImpl})
      : _getPostsRepositoryImpl = getPostsRepositoryImpl;
  @override
  Future<ModelPai> getPosts(int limit, int page) => _getPostsRepositoryImpl.getPosts(limit, page);
}
