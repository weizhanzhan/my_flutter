import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LayoutAction { action, routerPush,changeCurrentIndex }

class LayoutActionCreator {
  static Action onAction() {
    return const Action(LayoutAction.action);
  }

  static Action onRouterPush() {
    return const Action(LayoutAction.routerPush);
  }
  //改变当前bottomNavigationBar的currentIndex
  static Action onChangeCurrentIndex(currentIndex){
    print('--------------$currentIndex----------------');
    return Action(LayoutAction.changeCurrentIndex,payload:currentIndex);
  }
}
