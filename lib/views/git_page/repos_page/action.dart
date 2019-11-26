import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/views/git_page/repos_page/state.dart';

//TODO replace with your own action
enum ReposAction { action,init }

class ReposActionCreator {

  static Action onInit(list){
    return Action(ReposAction.init,payload: {
      'list':list
    });
  }
  static Action onAction() {
    return const Action(ReposAction.action);
  }
}
