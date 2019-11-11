import 'package:flutter/material.dart';
import 'package:my_flutter/views/Git/Followers_page/page.dart';
import 'package:my_flutter/views/Layout_page/page.dart';
import './views/Home/index.dart';
import './views/Git/Repos/index.dart';
import './components/Layout/index.dart';
import 'package:my_flutter/router/page_router.dart';
import 'package:fish_redux/fish_redux.dart';

void main() {
  PageRouter.setupRoutes();
  runApp(MyApp());
}

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
    'follower_page': FollowersPage(), //在这里添加页面
    'layout_page': LayoutPage()
  },
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //去除debug标签
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Layout(),
      // onGenerateRoute: PageRouter.router.generator,
      home: routes.buildPage('layout_page', null), //把他作为默认页面
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
