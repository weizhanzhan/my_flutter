import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class GitState implements Cloneable<GitState> {
  List<String> tags = [];
  TabController controller;

  @override
  GitState clone() {
    return GitState()
      ..tags = tags
      ..controller = controller;
  }
}

GitState initState(Map<String, dynamic> args) {
  return GitState();
}
