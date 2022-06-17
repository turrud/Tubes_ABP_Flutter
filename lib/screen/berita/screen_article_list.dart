import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tubes_abp_flutter/models/article_controller.dart';

import 'package:tubes_abp_flutter/models/articles_model.dart';

import 'package:get_it/get_it.dart';
import 'package:tubes_abp_flutter/screen/berita/article_view.dart';
import 'package:tubes_abp_flutter/screen/themes/app_themes.dart';

// locator
final locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<ArticleController>(() => ArticleController());
}

class ScreenBerita extends StatelessWidget {
  const ScreenBerita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.mainAppTheme,
        home: const ScreenArticleList());
  }
}

class ScreenArticleList extends StatefulWidget {
  const ScreenArticleList({Key? key}) : super(key: key);

  @override
  State<ScreenArticleList> createState() => _ScreenArticleListState();
}

class _ScreenArticleListState extends State<ScreenArticleList> {
  late Future<List<Article>> _articles;

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('News'),
            Text(' '),
            Text('GoWis', style: TextStyle(color: Colors.blue))
          ],
        ),
        elevation: 1.0,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getArticles();
        },
        child: FutureBuilder<List<Article>>(
          future: _articles,
          builder: (context, snapshot) {
            Widget data;
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: Message.ERROR_MESSAGE);
              data = Center(
                  child: Text(snapshot.error.toString(),
                      textAlign: TextAlign.center));
            } else if (snapshot.hasData) {
              Fluttertoast.showToast(msg: Message.SUCCESS_MESSAGE);
              final articleList = snapshot.data;
              data = articleList == null
                  ? const Center(child: Text('Received data is null'))
                  : ListView.builder(
                      itemCount: articleList.length,
                      itemBuilder: (context, i) {
                        return ArticleView(article: articleList[i]);
                      });
            } else {
              data = const Center(child: CircularProgressIndicator());
            }
            return data;
          },
        ),
      ),
    );
  }

  void getArticles() async {
    setState(() {
      _articles = locator.get<ArticleController>().getArticles();
    });
  }
}

class Message {
  // ignore: constant_identifier_names
  static const SUCCESS_MESSAGE = "Successfully fetched data";
  // ignore: constant_identifier_names
  static const ERROR_MESSAGE = "Failed to fetch data";
}
