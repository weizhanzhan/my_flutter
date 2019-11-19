import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GitAction { action }

class GitActionCreator {
  static Action onAction() {
    return const Action(GitAction.action);
  }
}
