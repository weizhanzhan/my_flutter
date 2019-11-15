import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action,getWeatherInfo }

class HomeActionCreator {
  static Action onAction() {
    return  Action(HomeAction.action);
  }
  static Action onGetWeatherInfo(){
    return Action(HomeAction.getWeatherInfo);
  }
}
