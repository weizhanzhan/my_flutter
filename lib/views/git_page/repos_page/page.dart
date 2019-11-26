import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReposPage extends Page<ReposState, Map<String, dynamic>> {
  ReposPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReposState>(
                adapter: null,
                slots: <String, Dependent<ReposState>>{
                }),
            middleware: <Middleware<ReposState>>[
            ],);

}
