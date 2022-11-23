import 'package:http/http.dart' as http;
import 'package:trademaster/models/model_get_posts/model_pai.dart';
import 'dart:convert';
import 'get_posts_repository.dart';

class GetPostsRepositoryImpl implements GetPostsRepository {
  @override
  Future<ModelPai> getPosts(int limit, int page) async {
    var url =
        Uri.parse('https://www.reddit.com/r/climbing/top.json?limit=$limit&page=$page');
    final response = await http.get(url);
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    return ModelPai.fromMap(mapResponse);
  }
}
