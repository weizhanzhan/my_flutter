import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'action.dart';
import 'state.dart';

Effect<LayoutState> buildEffect() {
  return combineEffects(<Object, Effect<LayoutState>>{
    Lifecycle.didChangeDependencies:_init,
    Lifecycle.didUpdateWidget:_init,
    LayoutAction.action: _onAction,
    LayoutAction.routerPush: _onRouterPush
  });
}
void _init(Action action, Context<LayoutState> ctx) {
  //  ScreenUtil.instance =  ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(ctx.context);
}
void _onAction(Action action, Context<LayoutState> ctx) {}

void _onRouterPush(Action action, Context<LayoutState> ctx) {
  Navigator.of(ctx.context).pushNamed('follower_page', arguments: null); //注意2
}
