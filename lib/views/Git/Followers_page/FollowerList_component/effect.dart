import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FollowerListState> buildEffect() {
  return combineEffects(<Object, Effect<FollowerListState>>{
    FollowerListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FollowerListState> ctx) {
}
