import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1
import 'action.dart';
import 'state.dart';

Effect<LayoutState> buildEffect() {
  return combineEffects(<Object, Effect<LayoutState>>{
    LayoutAction.action: _onAction,
    LayoutAction.routerPush: _onRouterPush
  });
}

void _onAction(Action action, Context<LayoutState> ctx) {}

void _onRouterPush(Action action, Context<LayoutState> ctx) {
  Navigator.of(ctx.context).pushNamed('follower_page', arguments: null); //注意2
}
