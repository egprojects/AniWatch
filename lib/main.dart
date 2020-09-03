import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:injector/injector.dart';

import 'core/services/anidub_service.dart';
import 'core/services/anime_service.dart';
import 'ui/main/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key) {
    Injector.appInstance
        .registerSingleton<AnimeService>((_) => AnidubService());
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFFD0101);
    return PlatformProvider(
      initialPlatform: TargetPlatform.android,
      builder: (_) => PlatformApp(
        title: 'AniTube',
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        material: (_, __) => MaterialAppData(
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
            accentColor: red,
            unselectedWidgetColor: Colors.grey[700],
            typography: Typography.material2018(),
            appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            accentColor: red,
            unselectedWidgetColor: Colors.grey[500],
            scaffoldBackgroundColor: Color(0xFF121212),
            typography: Typography.material2018(),
          ),
        ),
        cupertino: (_, __) => CupertinoAppData(
          theme: CupertinoThemeData(
            primaryColor: red,
          ),
        ),
      ),
    );
  }
}
