import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:injector/injector.dart';

import 'core/services/anidub_service.dart';
import 'core/services/anime_service.dart';
import 'ui/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key) {
    Injector.appInstance
        .registerSingleton<AnimeService>((_) => AnidubService());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'AniWatch',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      material: (_, __) => MaterialAppData(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      ),
      cupertino: (_, __) => CupertinoAppData(),
    );
  }
}
