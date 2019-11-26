import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EventsPage extends Page<EventsState, Map<String, dynamic>> {
  EventsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EventsState>(
                adapter: null,
                slots: <String, Dependent<EventsState>>{
                }),
            middleware: <Middleware<EventsState>>[
            ],);

}
