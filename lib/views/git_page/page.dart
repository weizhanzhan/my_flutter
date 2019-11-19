import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class GitPage extends Page<GitState, Map<String, dynamic>> {
  GitPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GitState>(
                adapter: null,
                slots: <String, Dependent<GitState>>{
                }),
            middleware: <Middleware<GitState>>[
            ],);

}
