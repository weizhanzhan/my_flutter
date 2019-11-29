import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';
// ScreenUtil.instance =  ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
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
