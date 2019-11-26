import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

//TODO replace with your own action
enum GitAction { init }

class GitActionCreator {
  static Action onInit(List<String>tags,TabController controller) {
    return  Action(GitAction.init,payload: {
      'tags':tags,
      'controller':controller
    });
  }
}
