import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:tubes_abp_flutter/models/article_controller.dart';
import 'package:tubes_abp_flutter/screen/WelcomeScreen/welcome.dart';

import 'screen/themes/app_themes.dart';

void main() {
  setup();
  runApp(const MyApp());
}

// locator
final locator = GetIt.instance;
void setup() {
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<ArticleController>(() => ArticleController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.mainAppTheme,
        home: const WelcomeScreen());
  }
}
