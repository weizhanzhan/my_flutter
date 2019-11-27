import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:my_flutter/components/loading.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ReposState state, Dispatch dispatch, ViewService viewService) {
  print('页面开始加载');
 return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child:state.list.length>0?EasyRefresh.custom(
         header: BallPulseHeader(),
        footer: BallPulseFooter(),
        // child:  
        onRefresh: () async{
        await Future.delayed(Duration(seconds: 2), () {
           
          });
        },
        onLoad: () async {
             await Future.delayed(Duration(seconds: 2), () {       
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                return  ListTile(
                  title: Text(state.list[index].name),
                  subtitle: Text(
                    state.list[index].description.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: Icon(Icons.games),
                );
        
              },
              childCount: state.list.length,
            ),
          ),
        ],
      ):LoadingView()
 );
      
     
}
// state.list.length>0? ListView.builder(
//         shrinkWrap: true,
//         // physics: NeverScrollableScrollPhysics(), //去除内部滚动
//         itemCount: state.list.length,
//         // itemExtent: 50.0,
//         itemBuilder: (BuildContext context, int index) {

//           return ListTile(
//             title: Text(state.list[index].name),
//             subtitle: Text(
//               state.list[index].description.toString(),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             leading: Icon(Icons.games),
//           );
//         },
//       ):LoadingView(),