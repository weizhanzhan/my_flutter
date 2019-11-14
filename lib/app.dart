
import 'package:flutter/material.dart';
import 'package:my_flutter/views/Git/Followers_page/page.dart';
import 'package:my_flutter/views/layout_page/page.dart';
import 'package:fish_redux/fish_redux.dart';


Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'follower_page': FollowersPage(), //在这里添加页面
      'layout_page': LayoutPage()
    },
  );

  return MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false, //去除debug标签
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home: Layout(),
    // onGenerateRoute: PageRouter.router.generator,
    home: routes.buildPage('follower_page', null), //把他作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
