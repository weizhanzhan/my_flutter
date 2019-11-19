import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<GitState> buildEffect() {
  return combineEffects(<Object, Effect<GitState>>{
    GitAction.action: _onAction,
  });
}

void _onAction(Action action, Context<GitState> ctx) {
}
