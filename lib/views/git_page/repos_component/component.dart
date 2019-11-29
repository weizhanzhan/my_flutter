import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReposComponent extends Component<ReposState> {
  ReposComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReposState>(
                adapter: null,
                slots: <String, Dependent<ReposState>>{
                }),);

}
