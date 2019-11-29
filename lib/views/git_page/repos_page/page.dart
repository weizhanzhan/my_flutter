import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

Widget keepAliveWrapper(Widget child) => KeepAliveWidget(child);

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
            ],
            wrapper: keepAliveWrapper,);

}
