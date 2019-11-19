import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<GitState> buildReducer() {
  return asReducer(
    <Object, Reducer<GitState>>{
      GitAction.action: _onAction,
    },
  );
}

GitState _onAction(GitState state, Action action) {
  final GitState newState = state.clone();
  return newState;
}
