import 'package:get_it/get_it.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tubes_abp_flutter/models/articles_model.dart';

class ArticleController {
  Future<List<Article>> getArticles() async {
    return locator.get<Repository>().getArticles();
  }
}

// locator
final locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<ArticleController>(() => ArticleController());
}

//repository impl
class RepositoryImpl extends Repository {
  @override
  Future<List<Article>> getArticles() async {
    final Map<String, String> queryParams = {
      'country': 'us',
      'category': 'technology'
    };
    final headers = {HttpHeaders.authorizationHeader: _API_KEY};
    final uri = Uri.parse(_BASE_URL).replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final articles = articlesFromJson(response.body);
      return articles.articles;
    } else {
      throw Exception('response status code: ${response.statusCode}');
    }
  }

  // ignore: constant_identifier_names
  static const String _BASE_URL = "https://newsapi.org/v2/top-headlines";

  // api key should be hidden to to prevent exposing it with static code analysis
  // ignore: constant_identifier_names
  static const String _API_KEY = "53dbe05b0b9a4154a8f5b44b2e9201ec";
}

// repository
abstract class Repository {
  Future<List<Article>> getArticles();
}
