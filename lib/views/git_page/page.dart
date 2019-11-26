import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class _gitState extends ComponentState<GitState> with SingleTickerProviderStateMixin{

}

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
  @override
  _gitState createState() {
    return _gitState();
  }
}
