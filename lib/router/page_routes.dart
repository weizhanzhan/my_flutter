import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../views/Git/Repos/index.dart';
import '../components/Layout/index.dart';

final Map<String, Handler> pageRoutes = {
  "/": Handler(handlerFunc: (BuildContext context, params) {
    return Layout();
  }),
  "/git-repos": Handler(handlerFunc: (BuildContext context, params) {
    return GitRepos();
  })
};
