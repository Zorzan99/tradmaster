import '../../../models/model_get_posts/model_pai.dart';

abstract class GetPostsRepository {
  Future<ModelPai> getPosts(int limit);
}
