import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/models/git/repos.dart';

class ReposState implements Cloneable<ReposState> {
  List<GitRepos> list = [];
  @override
  ReposState clone() {
    return ReposState()
      ..list = list;
  }
}

ReposState initState(Map<String, dynamic> args) {
  return ReposState();
}
