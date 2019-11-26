import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FolloweringState> buildEffect() {
  return combineEffects(<Object, Effect<FolloweringState>>{
    FolloweringAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FolloweringState> ctx) {
}
