import 'package:fish_redux/fish_redux.dart';

class LayoutState implements Cloneable<LayoutState> {
  int current;

  LayoutState({this.current});

  @override
  LayoutState clone() {
    return LayoutState()..current = current;
  }
}

LayoutState initState(Map<String, dynamic> args) {
  return LayoutState();
}
