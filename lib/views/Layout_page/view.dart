import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/views/Layout_page/page.dart';
// import '../Home/index.dart';
import '../home_page/page.dart';
import '../Account/index.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    LayoutState state, Dispatch dispatch, ViewService viewService) {
  // List<Widget> pages = <Widget>[HomePage(), AccoutPage()];
  return Scaffold(
    body: HomePage(),
    // bottomNavigationBar: BottomNavigationBar(
    //   onTap: (int index) {
    //     print(index);
    //   },
    //   currentIndex: 0,
    //   items: <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //         icon: Icon(IconData(0xe792, fontFamily: 'iconfont')),
    //         title: Text('Home')),
    //     BottomNavigationBarItem(
    //         icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont')),
    //         title: Text('Account')),
    //   ],
    // ),
  );
}
