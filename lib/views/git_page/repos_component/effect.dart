import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReposState> buildEffect() {
  return combineEffects(<Object, Effect<ReposState>>{
    ReposAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReposState> ctx) {
}
