
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/views/layout_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/views/git_page/page.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'layout_page': LayoutPage(),
      'git_page':GitPage()
    },
  );

  return MaterialApp(
    title: 'my_flutter',
    debugShowCheckedModeBanner: false, //去除debug标签
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('layout_page', null), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return CupertinoPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
