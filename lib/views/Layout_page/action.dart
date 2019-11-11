import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LayoutAction { action, routerPush }

class LayoutActionCreator {
  static Action onAction() {
    return const Action(LayoutAction.action);
  }

  static Action onRouterPush() {
    return const Action(LayoutAction.routerPush);
  }
}
