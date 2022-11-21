import '../../../models/model_get_posts/model_pai.dart';

abstract class GetPostsService {
  Future<ModelPai> getPosts(int limit);
}
