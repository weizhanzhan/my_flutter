import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReposState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReposState>>{
      ReposAction.action: _onAction,
    },
  );
}

ReposState _onAction(ReposState state, Action action) {
  final ReposState newState = state.clone();
  return newState;
}
