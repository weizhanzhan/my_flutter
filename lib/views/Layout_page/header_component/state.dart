import 'package:fish_redux/fish_redux.dart';

class HeaderState implements Cloneable<HeaderState> {
  int currentIndex;

  HeaderState({this.currentIndex});
  @override
  HeaderState clone() {
    return HeaderState()..currentIndex = currentIndex;
  }
}

HeaderState initState(Map<String, dynamic> args) {
  return HeaderState();
}
