import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AccountState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      child: Text('hello 我是个人中心'),
    ),
  );
}
