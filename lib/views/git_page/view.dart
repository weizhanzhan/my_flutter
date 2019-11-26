import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import './events_page/page.dart';
import './followering_page/page.dart';
import './followers_page/page.dart';
import './info_page/page.dart';
import './repos_page/page.dart';
import 'action.dart';
import 'state.dart';

class TabBarIndicatorWidget extends Decoration {
  BuildContext context;
  Color bgColor;

  TabBarIndicatorWidget(
      {@required this.context, this.bgColor = const Color(0xffffdc00)});

  @override
  BoxPainter createBoxPainter([onChanged]) =>
      _TabBarIndicatorBoxPainter(context, bgColor);
}

class _TabBarIndicatorBoxPainter extends BoxPainter {
  BuildContext context;
  Color bgColor;

  _TabBarIndicatorBoxPainter(this.context, this.bgColor);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = bgColor;
    paint.style = PaintingStyle.fill;
    final width = 14.0;
    final height = 14.0;
    canvas.drawCircle(
        Offset(offset.dx + configuration.size.width - 10, height + 2),
        width / 2,
        paint);
  }
}


Widget buildView(GitState state, Dispatch dispatch, ViewService viewService) {
 
  return Scaffold(
    appBar: AppBar(
      title: Icon(IconData(0xe885, fontFamily: 'iconfont')),
      bottom: TabBar(
        controller: state.controller ,
        labelColor: Colors.black,
        tabs: state.tags.map((String item) {
          return Tab(
            text: item,
          );
        }).toList(),
        // indicator: TabBarIndicatorWidget(context: viewService.context),
        unselectedLabelStyle: TextStyle(fontSize: 13),
        labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        isScrollable: true, //tab选项滑动   
        unselectedLabelColor: Color(0xff333333),
        labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 1.0,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
    ),
    
    body: SafeArea(
      child:Column(
        children: <Widget>[
          Expanded( child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: state.controller,
            children: <Widget>[
              ReposPage().buildPage(null),
              EventsPage().buildPage(null),
              FollowersPage().buildPage(null),
              FolloweringPage().buildPage(null),
              InfoPage().buildPage(null),
            ],
            // children: state.tags.map((item) {
            //   return Text(item);
            // }).toList(),
          ))
        ],
      )
    )
  );
}
