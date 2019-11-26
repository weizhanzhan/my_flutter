import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState:_init,
    HomeAction.action: _onAction,
  });
}
void _init(Action action, Context<HomeState> ctx){
   
    print('home_page页面初始化加载');
    // ctx.dispatch()
}
void _onAction(Action action, Context<HomeState> ctx) {
}
