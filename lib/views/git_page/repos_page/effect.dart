import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/services/git.dart';
import 'action.dart';
import 'state.dart';

Effect<ReposState> buildEffect() {
  return combineEffects(<Object, Effect<ReposState>>{
    Lifecycle.initState : _init,
    ReposAction.action: _onAction,
  });
}

void _init(Action action,Context<ReposState> ctx) async{
  print('git_repos页面初始化加载');
  try {
     var list = await GitService.getGitRepos();
   ctx.dispatch(ReposActionCreator.onInit(list,false));
  } catch (e) {
    ctx.dispatch(ReposActionCreator.onInit([],true));
  }
 
}
void _onAction(Action action, Context<ReposState> ctx) {
}
