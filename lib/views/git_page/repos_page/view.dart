import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:my_flutter/components/loading.dart';
import 'package:my_flutter/models/git/repos.dart';

import 'action.dart';
import 'state.dart';


Color switchColors(String type,BuildContext context){
  switch (type) {
    case 'CSS':
      return Colors.redAccent;
    case 'JavaScript':
      return Colors.blue;
    case 'C++':
      return Colors.pinkAccent;
    case 'HYML':
      return Colors.yellowAccent;
    case 'Dart':
      return Colors.greenAccent;
    case 'Vue':
      return Colors.green;
    case 'React':
      return Colors.blueAccent;
    default:
      return Theme.of(context).primaryColor;
  }
  
}
Widget buildView(ReposState state, Dispatch dispatch, ViewService viewService) {
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
                GitRepos item = state.list[index];
                // return  ListTile(
                //   title: Text(state.list[index].name),
                //   subtitle: Text(
                //     state.list[index].description.toString(),
                //     maxLines: 2,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   leading: Icon(Icons.games),
                // );
                String language =( item.language == null)? '无':item.language;
                return Container(
                  // child: Image.network('https://avatars3.githubusercontent.com/u/32046397?v=4',width: 10.0,) ,
                  child: Column(
                    children: <Widget>[
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item.owner.login),
                          // Image.network('https://avatars3.githubusercontent.com/u/32046397?v=4',width: 10.0,),
                          Row(
                           children: <Widget>[
                            CircleType(color: switchColors(language, context)),
                             Text(language)
                           ],
                          )
                        ],
                      ),
                       Container(
                         
                         child: Text(item.name,textAlign: TextAlign.left,),
                       )
                    ],
                   
                  ),
                );
        
              },
              childCount: state.list.length,
            ),
          ),
        ],
      ):LoadingView()
 );
      
     
}

class CircleType extends StatelessWidget {
  final Color color;
  const CircleType({Key key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5.0),
      //     color: Colors.red
      //   ),
      //   child: Text('ss'),
      // ),
      child: CircleAvatar(
        radius:7.0,
        backgroundColor: color
      ),
    );
  }
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