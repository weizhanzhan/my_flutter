import 'package:fish_redux/fish_redux.dart';

class ReposState implements Cloneable<ReposState> {

  @override
  ReposState clone() {
    return ReposState();
  }
}

ReposState initState(Map<String, dynamic> args) {
  return ReposState();
}
