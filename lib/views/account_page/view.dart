import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AccountState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      child: Image.network('https://avatars3.githubusercontent.com/u/32046397?v=4'),
    ),
  );
}
