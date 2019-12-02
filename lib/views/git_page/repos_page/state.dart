import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/models/git/repos.dart';

class ReposState implements Cloneable<ReposState> {
  List<GitRepos> list = [];
  int page = 0;
  int size = 10;
  @override
  ReposState clone() {
    return ReposState()
      ..list = list
      ..page= page
      ..size = size;
  }
}

ReposState initState(Map<String, dynamic> args) {
  return ReposState();
}
