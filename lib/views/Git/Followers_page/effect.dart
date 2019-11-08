import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/router/page_router.dart';
import 'action.dart';
import 'state.dart';

Effect<FollowersState> buildEffect() {
  return combineEffects(<Object, Effect<FollowersState>>{
    FollowersAction.action: _onAction,
    FollowersAction.btnClick: _onBtnClick
  });
}

void _onAction(Action action, Context<FollowersState> ctx) {
}

void _onBtnClick(Action action, Context<FollowersState> ctx){
  print('heeel');
  PageRouter.router.pop(ctx.context);
}