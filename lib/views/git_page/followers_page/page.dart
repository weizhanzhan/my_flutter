import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FollowersPage extends Page<FollowersState, Map<String, dynamic>> {
  FollowersPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FollowersState>(
                adapter: null,
                slots: <String, Dependent<FollowersState>>{
                }),
            middleware: <Middleware<FollowersState>>[
            ],);

}
