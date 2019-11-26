import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EventsAction { action }

class EventsActionCreator {
  static Action onAction() {
    return const Action(EventsAction.action);
  }
}
