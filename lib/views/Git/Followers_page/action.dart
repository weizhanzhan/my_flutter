import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FollowersAction { action, btnClick }

class FollowersActionCreator {
  static Action onAction() {
    return const Action(FollowersAction.action);
  }

  static Action onBtnClick() {
    return const Action(FollowersAction.btnClick);
  }
}
