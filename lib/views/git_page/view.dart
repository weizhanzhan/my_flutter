import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(GitState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title:Text('Github',style: TextStyle(
        color: Colors.black
      ),),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 1.0,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
    ),
    body: SafeArea(
      child:Text('ss')
    )
  );
}
