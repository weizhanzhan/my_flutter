import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'package:my_flutter/views/account_page/page.dart';
import 'package:my_flutter/views/home_page/page.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    LayoutState state, Dispatch dispatch, ViewService viewService) {
   List<Widget> pages = <Widget>[HomePage().buildPage(null), AccountPage().buildPage(null)];
  return Scaffold(
    body: pages[state.current],
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        print(index);
        dispatch(LayoutActionCreator.onChangeCurrentIndex(index));
      },
      currentIndex: state.current,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe792, fontFamily: 'iconfont')),
            title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont')),
            title: Text('Account')),
      ],
    ),
  );
}
