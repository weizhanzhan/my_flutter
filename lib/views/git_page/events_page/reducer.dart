import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EventsState> buildReducer() {
  return asReducer(
    <Object, Reducer<EventsState>>{
      EventsAction.action: _onAction,
    },
  );
}

EventsState _onAction(EventsState state, Action action) {
  final EventsState newState = state.clone();
  return newState;
}
