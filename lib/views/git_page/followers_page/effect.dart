import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FollowersState> buildEffect() {
  return combineEffects(<Object, Effect<FollowersState>>{
    FollowersAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FollowersState> ctx) {
}
