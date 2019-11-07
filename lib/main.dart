import 'package:flutter/material.dart';
import './views/Home/index.dart';
import './views/Git/Repos/index.dart';
import './components/Layout/index.dart';
import 'package:my_flutter/router/page_router.dart';

void main() {
  PageRouter.setupRoutes();
  runApp(MyApp());
}

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
      onGenerateRoute: PageRouter.router.generator,
    );
  }
}
