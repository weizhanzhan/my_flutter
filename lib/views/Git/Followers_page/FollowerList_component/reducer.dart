import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FollowerListState> buildReducer() {
  return asReducer(
    <Object, Reducer<FollowerListState>>{
      FollowerListAction.action: _onAction,
    },
  );
}

FollowerListState _onAction(FollowerListState state, Action action) {
  final FollowerListState newState = state.clone();
  return newState;
}
