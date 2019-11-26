import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GitState> buildReducer() {
  return asReducer(
    <Object, Reducer<GitState>>{
      GitAction.init: _onInit,
    },
  );
}

GitState _onInit(GitState state, Action action) {

  final GitState newState = state.clone();
  newState.controller = action.payload['controller'];
  newState.tags = action.payload['tags'];
  return newState;
}
