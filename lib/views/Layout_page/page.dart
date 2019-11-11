import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LayoutPage extends Page<LayoutState, Map<String, dynamic>> {
  LayoutPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LayoutState>(
                adapter: null,
                slots: <String, Dependent<LayoutState>>{
                }),
            middleware: <Middleware<LayoutState>>[
            ],);

}
