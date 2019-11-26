import 'package:fish_redux/fish_redux.dart';

class FolloweringState implements Cloneable<FolloweringState> {

  @override
  FolloweringState clone() {
    return FolloweringState();
  }
}

FolloweringState initState(Map<String, dynamic> args) {
  return FolloweringState();
}
