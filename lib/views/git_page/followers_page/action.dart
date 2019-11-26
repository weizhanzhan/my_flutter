import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FollowersAction { action }

class FollowersActionCreator {
  static Action onAction() {
    return const Action(FollowersAction.action);
  }
}
