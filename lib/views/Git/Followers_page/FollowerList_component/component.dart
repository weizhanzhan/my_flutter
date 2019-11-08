import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FollowerListComponent extends Component<FollowerListState> {
  FollowerListComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FollowerListState>(
                adapter: null,
                slots: <String, Dependent<FollowerListState>>{
                }),);

}
