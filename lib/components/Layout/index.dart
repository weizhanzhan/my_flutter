import 'package:flutter/material.dart';
import '../../views/Home/index.dart';
import '../../views/Account/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;
  static List<Widget> pages = <Widget>[HomePage(), AccoutPage()];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
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
}
