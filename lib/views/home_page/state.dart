import 'package:fish_redux/fish_redux.dart';

class HomeState implements Cloneable<HomeState> {

  bool weatherLoading;
  Map weatherInfo;
  HomeState({
    this.weatherLoading = false,
    this.weatherInfo
  });
  @override
  HomeState clone() {
    return HomeState()
      ..weatherInfo = weatherInfo
      ..weatherLoading = weatherLoading;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
