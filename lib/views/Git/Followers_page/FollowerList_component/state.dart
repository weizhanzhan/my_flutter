import 'package:fish_redux/fish_redux.dart';

class FollowerListState implements Cloneable<FollowerListState> {

  @override
  FollowerListState clone() {
    return FollowerListState();
  }
}

FollowerListState initState(Map<String, dynamic> args) {
  return FollowerListState();
}
