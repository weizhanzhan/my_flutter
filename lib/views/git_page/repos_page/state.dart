import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/models/git/repos.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReposState implements Cloneable<ReposState> {
  List<GitRepos> list = [];
  int page = 1;
  int size = 10;
  RefreshController refreshController =  RefreshController(initialRefresh: false);
  @override
  ReposState clone() {
    return ReposState()
      ..list = list
      ..page = page
      ..size = size
      ..refreshController = refreshController ;
  }
}

ReposState initState(Map<String, dynamic> args) {
  return ReposState();
}
