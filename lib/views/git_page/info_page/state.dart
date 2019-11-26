import 'package:fish_redux/fish_redux.dart';

class InfoState implements Cloneable<InfoState> {

  @override
  InfoState clone() {
    return InfoState();
  }
}

InfoState initState(Map<String, dynamic> args) {
  return InfoState();
}
