import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<GitState> buildEffect() {
  return combineEffects(<Object, Effect<GitState>>{
    Lifecycle.initState:_init,
 
  });
}
void _init(dynamic action, Context<GitState> ctx){
  List<String> list = ['repos','events','followers','followering','info',];
  //初始化tabbar
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  TabController controller = TabController(length: list.length, vsync: tickerProvider);
  ctx.dispatch(GitActionCreator.onInit(list,controller));
}
