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
    backgroundColor: Color(0xFFF2F3F8),
    body: pages[state.current],
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        dispatch(LayoutActionCreator.onChangeCurrentIndex(index));
      },
       backgroundColor: Color(0xFFF2F3F8),
      // backgroundColor:Colors.lightBlueAccent,
      // fixedColor: Colors.red,
      currentIndex: state.current,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe792, fontFamily: 'iconfont')),
            title: Text('Home',style: TextStyle(fontSize: 12),)),
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont')),
            title: Text('Account',style: TextStyle(fontSize: 12))),
      ],
    ),
    //  floatingActionButton: FloatingActionButton(
    //     backgroundColor: Colors.lightBlueAccent,
    //     elevation: 0,
    //     onPressed: () {
         
    //     },
    //     tooltip: 'Increment',
    //     child: DecoratedBox(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Colors.white,
    //       ),
    //       child: SizedBox(
    //           height: 48,
    //           width: 48,
    //           child: Icon(Icons.add,color: Colors.lightBlueAccent,)),
    //     ),
    //   ), // T
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // his
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 8,
      //   color: Colors.lightBlueAccent,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(Icons.near_me),
      //         color: Colors.white,
              
      //         onPressed: () {
               
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.edit_location),
      //         color: Colors.white,
      //         onPressed: () {
               
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  
  
}
