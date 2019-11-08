import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FollowersState> buildReducer() {
  return asReducer(
    <Object, Reducer<FollowersState>>{
      FollowersAction.action: _onAction,
    },
  );
}

FollowersState _onAction(FollowersState state, Action action) {
  final FollowersState newState = state.clone();
  return newState;
}
