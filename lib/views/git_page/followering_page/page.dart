import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FolloweringPage extends Page<FolloweringState, Map<String, dynamic>> {
  FolloweringPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FolloweringState>(
                adapter: null,
                slots: <String, Dependent<FolloweringState>>{
                }),
            middleware: <Middleware<FolloweringState>>[
            ],);

}
