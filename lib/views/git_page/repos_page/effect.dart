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
    var list = await GitService.getGitRepos(page: 1,size:ctx.state.size);
    ctx.state.refreshController.refreshCompleted();
    ctx.state.refreshController.resetNoData();
    ctx.dispatch(ReposActionCreator.onFetchSuccess(list,reset: true));
  }else{
    print('执行');
    var list = await GitService.getGitRepos(page: ctx.state.page,size:ctx.state.size);
    List allList = ctx.state.list;
    allList.addAll(list);
    if(list.length<ctx.state.size){
      ctx.state.refreshController.loadNoData();
    }else{
      ctx.state.refreshController.loadComplete();
      ctx.dispatch(ReposActionCreator.onFetchSuccess(allList));
    }
  
 
  }
  
}

void _onRefresh(Action action, Context<ReposState> ctx) async{
    ctx.dispatch(ReposActionCreator.onFetch(reset: true));
}
