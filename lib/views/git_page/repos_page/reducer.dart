import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReposState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReposState>>{
  
      ReposAction.init:_onInit,
 
      ReposAction.fetchSuccess:_onFetchSuccess
    },
  );
}

ReposState _onInit(ReposState state, Action action) {
  final ReposState newState = state.clone();
  newState.list = action.payload['list'];
  return newState;
}


ReposState _onFetchSuccess(ReposState state, Action action) {
  final ReposState newState = state.clone();
  newState.list = action.payload['list'];
  if(action.payload['reset']) {
    newState.page = 0;
  } else {
    newState.page ++;
  }
  return newState;
}
