import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FolloweringState> buildReducer() {
  return asReducer(
    <Object, Reducer<FolloweringState>>{
      FolloweringAction.action: _onAction,
    },
  );
}

FolloweringState _onAction(FolloweringState state, Action action) {
  final FolloweringState newState = state.clone();
  return newState;
}
