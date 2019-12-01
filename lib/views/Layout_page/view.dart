import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:my_flutter/views/account_page/page.dart';
// import 'package:my_flutter/views/home_page/page.dart';
import 'package:my_flutter/views/Home/index.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    LayoutState state, Dispatch dispatch, ViewService viewService) {
    List<Widget> pages = <Widget>[HomePage(), AccountPage().buildPage(null)];
    // ScreenUtil.instance =  ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(viewService.context);
  return Scaffold(
    body: pages[state.current],
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        dispatch(LayoutActionCreator.onChangeCurrentIndex(index));
      },
      currentIndex: state.current,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe792, fontFamily: 'iconfont')),
            title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont')),
            title: Text('Account',)),
      ],
    ),
  );
}
