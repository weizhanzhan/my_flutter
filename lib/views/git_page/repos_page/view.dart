import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:my_flutter/components/loading.dart';
import 'package:my_flutter/models/git/repos.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
    // EasyRefreshController _controller = EasyRefreshController();
    //  RefreshController _refreshController =  RefreshController(initialRefresh: false);
    List items = state.list;
    return Container(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
               body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: state.refreshController,
      
        onRefresh: ()async{
            dispatch(ReposActionCreator.onRefresh());
            // monitor network fetch
            // await Future.delayed(Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            // _refreshController.refreshCompleted();
          },
        onLoading: () async{
          dispatch(ReposActionCreator.onFetch());
          // monitor network fetch
          // await Future.delayed(Duration(milliseconds: 1000));
          // if failed,use loadFailed(),if no data return,use LoadNodata()
          // items.add((items.length+1).toString());
         
          // _refreshController.loadComplete();
          // _refreshController.loadNoData();
        },
        child: ListView.builder(
          itemBuilder: (c, i) => _buildCardItem(items[i],viewService.context),
          // itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
      // margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
    
    
 );
      
     
}

Widget _buildCardItem(item,context){
  String language =( item.language == null)? '无':item.language;
  Color fontColor = Colors.grey[600];
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 1,color: Colors.grey[300]))
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
                CircleType(color: switchColors(language, context)),  Text(language)
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
}

class CircleType extends StatelessWidget {
  final Color color;
  const CircleType({Key key,this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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


  // child: Text(state.isErr.toString()),
      // child:state.list.length>0?EasyRefresh.custom(
      //   controller: _controller,
      //   enableControlFinishRefresh: true,
	    //   enableControlFinishLoad: true,
      //   taskIndependence:true,
      //   header: BallPulseHeader(),
      //   footer: BallPulseFooter(),
      //   // child:  
      //   onRefresh: () async{

      //     await Future.delayed(Duration(seconds: 2), () {   
      //       _controller.finishRefresh(success: true);    
      //         _controller.resetRefreshState();
      //     });
      //     // _controller.callRefresh();
      //     // dispatch(ReposActionCreator.onRefresh());
         
      //     //  await Future.delayed(Duration(seconds: 2), () {
      //     //   _controller.finishRefresh(success: true);
      //     // });
      //   },
      //   onLoad: () async {
      //       // dispatch(ReposActionCreator.onFetch());
           
      //        await Future.delayed(Duration(seconds: 2), () {    
      //          _controller.finishLoad(success: true,noMore: true);   
      //           _controller.resetLoadState();
      //     });
      //   },
      //   slivers: <Widget>[
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate((context, index) {
      //           GitRepos item = state.list[index];
      //           String language =( item.language == null)? '无':item.language;
      //           Color fontColor = Colors.grey[600];
      //           return Container(
      //               padding: EdgeInsets.all(16),
      //                 decoration: BoxDecoration(
      //                   border: Border(bottom: BorderSide(width: 1,color: Colors.grey[300]))
      //                 ),
      //             // child: Image.network('https://avatars3.githubusercontent.com/u/32046397?v=4',width: 10.0,) ,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 Text(state.page.toString()),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[    
      //                         Image.network('http://test1.zlpfs.com/timg.jpg',width:setScreen(type: 'w',value: 40),height:setScreen(type: 'w',value: 40),),
      //                         Text('  ${item.owner.login}'),
      //                       ],
      //                     ),
      //                     Row(
      //                      children: <Widget>[
      //                       CircleType(color: switchColors(language, context)),
      //                        Text(language)
      //                      ],
      //                     )
      //                   ],
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      //                   child: Text(item.name,style: TextStyle(fontSize: setScreen(type: 'size',value: 25),fontWeight: FontWeight.w500),),
      //                 ),
      //                 Container(
      //                   child: Text(item.description !=null?item.description:'暂无描述信息',textAlign: TextAlign.left,style: TextStyle( color: fontColor,),),
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(top: 12),
      //                   child: Row(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: <Widget>[
      //                       Icon(IconData(0xe638, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),), 
      //                       Text(' ${item.stargazersCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),                 
      //                       Icon(IconData(0xe611, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),),
      //                       Text(' ${item.openIssuesCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),   
      //                       Icon(IconData(0xe64e, fontFamily: 'iconfont'),color: fontColor,size: setScreen(type: 'size',value: 25),),
      //                       Text(' ${item.forksCount}  ',style: TextStyle(fontSize: setScreen(type: 'size',value: 20),color: fontColor),),   
      //                     ],
      //                   ),
      //                 )
      //               ],
                   
      //             ),
      //           );
        
      //         },
      //         childCount: state.list.length,
      //       ),
      //     ),
      //   ],
      // ):LoadingView()