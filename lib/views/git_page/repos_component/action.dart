import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReposAction { action }

class ReposActionCreator {
  static Action onAction() {
    return const Action(ReposAction.action);
  }
}
