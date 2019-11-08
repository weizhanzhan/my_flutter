import 'package:fish_redux/fish_redux.dart';

class FollowersState implements Cloneable<FollowersState> {

  @override
  FollowersState clone() {
    return FollowersState();
  }
}

FollowersState initState(Map<String, dynamic> args) {
  return FollowersState();
}
