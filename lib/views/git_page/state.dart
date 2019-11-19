import 'package:fish_redux/fish_redux.dart';

class GitState implements Cloneable<GitState> {

  @override
  GitState clone() {
    return GitState();
  }
}

GitState initState(Map<String, dynamic> args) {
  return GitState();
}
