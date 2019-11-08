import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FollowerListAction { action }

class FollowerListActionCreator {
  static Action onAction() {
    return const Action(FollowerListAction.action);
  }
}
