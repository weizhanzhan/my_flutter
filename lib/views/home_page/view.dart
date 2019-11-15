import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.instance =  ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(viewService.context);
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderTitle(),
            HeaderSwiper(),
            WeatherBox(
              loading: state.weatherLoading,
              weatherInfo: state.weatherInfo,
            )
          ],
        ),
      )
    )
  );
}


// 头部标题
class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Learn and live!',
            style: TextStyle(
              fontSize: setScreen(type: 'size', value: 25.0),
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                IconData(0xe70a, fontFamily: 'iconfont'),
                size: setScreen(type: 'size', value: 35.0)
              )
            ],
          )
        ],
      ),
    );
  }
}
// 头部banner
class HeaderSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgs = [
      'assets/img/banner1.jpg',
      'assets/img/banner3.jpg',
      'assets/img/banner4.jpg',
      'assets/img/banner5.jpg',
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
      width: double.infinity,
      height: setScreen(type: 'h', value: 240),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: Image.asset(imgs[index], fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          );
        },
        itemCount: imgs.length,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: new SwiperPagination(),
      ),
    );
  }
}

// 天气
class WeatherBox extends StatelessWidget {
  final Map weatherInfo;
  final bool loading;
  WeatherBox({Key key, this.weatherInfo, this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        // margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
        padding: EdgeInsets.only(top: 10.0),
        child: Text('ε=( o｀ω′)ノ 正在加载...',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 18))),
      );
    }
    if (weatherInfo == null) {
      return Container(
        // margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
        padding: EdgeInsets.only(top: 10.0),
        child: Text('/(ㄒoㄒ)/~~ 暂无数据...',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 18))),
      );
    }
    var now = weatherInfo['data']['forecast'][0];
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
        // margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
        padding: EdgeInsets.only(top: 10.0),
        child: Row(children: <Widget>[
          Icon(
            IconData(0xe7db, fontFamily: 'iconfont'),
            size: setScreen(type: 'size', value: 25.0),
          ),
          Text(
            '  ${now['date']} ${weatherInfo['data']['city']}   ${now['type']}   ${now['high']}   ${now['low']}',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 18)),
          ),
        ]));
  }
}