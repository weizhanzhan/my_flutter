import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1
import 'package:my_flutter/router/page_router.dart';
import 'action.dart';
import 'state.dart';

Effect<FollowersState> buildEffect() {
  return combineEffects(<Object, Effect<FollowersState>>{
    FollowersAction.action: _onAction,
    FollowersAction.btnClick: _onBtnClick
  });
}

void _onAction(Action action, Context<FollowersState> ctx) {}

void _onBtnClick(Action action, Context<FollowersState> ctx) {
  // PageRouter.router.pop(ctx.context);
  Navigator.of(ctx.context).pushNamed('layout_page', arguments: null); //注意2
}
