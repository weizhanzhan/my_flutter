import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<EventsState> buildEffect() {
  return combineEffects(<Object, Effect<EventsState>>{
    EventsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<EventsState> ctx) {
}
