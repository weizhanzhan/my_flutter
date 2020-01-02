import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:my_flutter/views/account_page/page.dart';
import 'package:my_flutter/views/Home/index.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    LayoutState state, Dispatch dispatch, ViewService viewService) {
    List<Widget> pages = <Widget>[HomePage(), AccountPage().buildPage(null)];
  return Scaffold(
    backgroundColor: Color(0xFFF2F3F8),
    body: pages[state.current],
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        dispatch(LayoutActionCreator.onChangeCurrentIndex(index));
      },
      backgroundColor: Colors.white,
      selectedFontSize: 18.0,
      currentIndex: state.current,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          
            icon: Icon(IconData(0xe792, fontFamily: 'iconfont'),size: 20,),
            title: Text('Home',style: TextStyle(fontSize: 16),)),
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont'),size: 20),
            title: Text('Account',style: TextStyle(fontSize: 16))),
      ],
    ),
    );
  
  
}
