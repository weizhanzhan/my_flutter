import 'package:flutter/material.dart';
import 'package:my_flutter/utils/screen.dart';
// 隔断线

class DirverLine extends StatelessWidget {
  final double marginTop ;
    DirverLine({Key key, this.marginTop = 0.00}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(marginTop);
    return 
       Container(
         margin: EdgeInsets.only(top: marginTop),
         width: getScreenWidth(),
         height: setScreen(type:'h',value:20),
         decoration: BoxDecoration(
           color: Color.fromRGBO(245, 245, 245, 1),
         ),
    );
  }
}