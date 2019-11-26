import 'package:fish_redux/fish_redux.dart';

class EventsState implements Cloneable<EventsState> {

  @override
  EventsState clone() {
    return EventsState();
  }
}

EventsState initState(Map<String, dynamic> args) {
  return EventsState();
}
