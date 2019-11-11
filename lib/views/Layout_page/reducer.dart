import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LayoutState> buildReducer() {
  return asReducer(
    <Object, Reducer<LayoutState>>{
      LayoutAction.action: _onAction,
    },
  );
}

LayoutState _onAction(LayoutState state, Action action) {
  final LayoutState newState = state.clone();
  return newState;
}
