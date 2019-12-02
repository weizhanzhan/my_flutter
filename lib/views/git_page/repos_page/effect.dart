import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/services/git.dart';
import 'action.dart';
import 'state.dart';

Effect<ReposState> buildEffect() {
  return combineEffects(<Object, Effect<ReposState>>{
    Lifecycle.initState : _init,
    ReposAction.onRefresh: _onRefresh,
    ReposAction.onFetch:_onFetch
  });
}

void _init(Action action,Context<ReposState> ctx) async{
    // var list = await GitService.getGitRepos(page: ctx.state.page,size:ctx.state.size);
    ctx.dispatch(ReposActionCreator.onFetch());
}
void _onFetch(Action action, Context<ReposState> ctx) async{
  if(action.payload['reset']){
    var list = await GitService.getGitRepos(page: 0,size:ctx.state.size);
    ctx.dispatch(ReposActionCreator.onFetchSuccess(list,reset: true));
  }else{
    var list = await GitService.getGitRepos(page: ctx.state.page,size:ctx.state.size);
    ctx.dispatch(ReposActionCreator.onFetchSuccess(list));
  }
  
}

void _onRefresh(Action action, Context<ReposState> ctx) async{
    ctx.dispatch(ReposActionCreator.onFetch(reset: true));
}
