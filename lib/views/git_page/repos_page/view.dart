import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter/utils/screen.dart';
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
    EasyRefreshController _controller = EasyRefreshController();
    return Container(
      // margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
    
      // child: Text(state.isErr.toString()),
      child:state.list.length>0?EasyRefresh.custom(
        controller: _controller,
        enableControlFinishRefresh: true,
	      enableControlFinishLoad: true,
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        // child:  
        onRefresh: () async{
          dispatch(ReposActionCreator.onRefresh());
          print(state.page);
           await Future.delayed(Duration(seconds: 2), () {
            _controller.finishRefresh(success: true);
          });
        },
        onLoad: () async {
            dispatch(ReposActionCreator.onFetch());
           
          //    await Future.delayed(Duration(seconds: 2), () {       
          // });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                GitRepos item = state.list[index];
                String language =( item.language == null)? '无':item.language;
                Color fontColor = Colors.grey[600];
                return Container(
                    padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1,color: Colors.grey[300]))
                      ),
                  // child: Image.network('https://avatars3.githubusercontent.com/u/32046397?v=4',width: 10.0,) ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(state.page.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[    
                              Image.network('http://test1.zlpfs.com/timg.jpg',width:setScreen(type: 'w',value: 40),height:setScreen(type: 'w',value: 40),),
                              Text('  ${item.owner.login}'),
                            ],
                          ),
                          Row(
                           children: <Widget>[
                            CircleType(color: switchColors(language, context)),
                             Text(language)
                           ],
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(item.name,style: TextStyle(fontSize: setScreen(type: 'size',value: 25),fontWeight: FontWeight.w500),),
                      ),
                      Container(
                        child: Text(item.description !=null?item.description:'暂无描述信息',textAlign: TextAlign.left,style: TextStyle( color: fontColor,),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(IconData(0xe638, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),), 
                            Text(' ${item.stargazersCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),                 
                            Icon(IconData(0xe611, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),),
                            Text(' ${item.openIssuesCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),   
                            Icon(IconData(0xe64e, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),),
                            Text(' ${item.forksCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),   
                          ],
                        ),
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