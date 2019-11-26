import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InfoAction { action }

class InfoActionCreator {
  static Action onAction() {
    return const Action(InfoAction.action);
  }
}
