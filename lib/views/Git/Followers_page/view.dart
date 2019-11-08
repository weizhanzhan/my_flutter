import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/router/page_router.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(FollowersState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      child: Container(
        child: MaterialButton(
          child: Text('hello'),
          onPressed: (){
            print('tetet');
            dispatch(FollowersActionCreator.onBtnClick());
            // PageRouter.router.pop(context);
          },
        )
      ),
    )
  );
}

