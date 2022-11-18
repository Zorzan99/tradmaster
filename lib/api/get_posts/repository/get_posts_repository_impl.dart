import 'package:http/http.dart' as http;
import 'package:trademaster/models/model_get_posts/model_pai.dart';
import 'dart:convert';
import 'get_posts_repository.dart';

class GetPostsRepositoryImpl implements GetPostsRepository {
  @override
  Future<ModelPai> getPosts() async {
    var url = Uri.parse('https://www.reddit.com/r/climbing/top.json?limit=1');
    print(url);
    final response = await http.get(url);
    print(response);
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    print('mapresponse ${mapResponse}');
    return ModelPai.fromMap(mapResponse);
  }
}
