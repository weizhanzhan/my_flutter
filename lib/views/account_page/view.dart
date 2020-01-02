import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/components/DirverLine.dart';
import 'package:my_flutter/utils/screen.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AccountState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
     child:SingleChildScrollView(
       child: Column(
         children: <Widget>[
            AccountHeader(),
            DirverLine(),
         ],
       ),
     )
    ),
  );
}

class AccountHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: setScreen(type: 'w',value: 400.0),
          width: getScreenWidth(),
          child: Stack(
            children: <Widget>[
              _headerBg(),
              _headerMenu(),
              _headerAvatarBg(),
              _headerAvatar(),
              _headerDes(),
            ],
          ),
        ),
       
      ],
    );
  }
}

Widget _headerBg (){
  return Positioned(
    child: Container(
        height: setScreen(type: 'w',value: 235.0),
        width: getScreenWidth(),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(39, 106, 206, 0.8),Color.fromRGBO(41, 189, 217, 0.8)]),
        ),
    ),
  );
}
Widget _headerMenu(){
  return Positioned(
    top: setScreen(type: 'w',value: 40.0),
    right: setScreen(type: 'w',value: 40.0),
    child: Container(
      height: setScreen(type: 'w',value: 60.0),
      width: setScreen(type: 'w',value: 60.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
      child: Icon(Icons.menu,color: Colors.white,),
    ),
  );
}
Widget _headerAvatarBg(){
  return Positioned(//avatar bg
    bottom: setScreen(type: 'w',value: 110.0),
    left: setScreen(type: 'w',value: 40.0),
    child: Container(
      height: setScreen(type: 'w',value: 140.0),
      width: setScreen(type: 'w',value: 140.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: Color.fromRGBO(89, 126, 247, 1),
      ),
      child:Container(
        width: 10,
        height: 10,
      )
    ),
  );
}
Widget _headerAvatar(){
  return Positioned(//avatar
    bottom: setScreen(type: 'w',value: 120.0),
    left: setScreen(type: 'w',value: 50.0),
    child: Container(
      height: setScreen(type: 'w',value: 120.0),
      width: setScreen(type: 'w',value: 120.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: Color.fromRGBO(189, 126, 247, 1),
      ),
      child:Container(
        child: ClipRRect(
          child:Image.asset('assets/img/avatar.jpg',),
          borderRadius:BorderRadius.circular(100)
        )//,
      )
    ),
  );
}

Widget _headerDes(){
  return Positioned(
    bottom: setScreen(type: 'w',value: 20.0),
    left: setScreen(type: 'w',value: 50.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('魏展展', style: TextStyle(fontSize: setScreen(type: 'size',value: 36),fontWeight: FontWeight.bold),),
        ),
        Container(
          padding: EdgeInsets.only(top: setScreen(type: 'w',value: 5)),
          child: Text(' https://github.com/weizhanzhan ',style: TextStyle(fontSize: setScreen(type: 'size',value: 22),color: Color.fromRGBO(140, 140, 140, 1)),),
        )
      ],   
    ),
  );
}