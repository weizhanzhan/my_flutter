import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderTitle(),
            HeaderSwiper(),
            Text(setScreen(type: 'size', value: 20).toString()),
            WeatherBox(
              loading: state.weatherLoading,
              weatherInfo: state.weatherInfo,
            ),
            ApplicationGrid()
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
              fontSize: setScreen(type: 'size', value: 35.0),
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
        // viewportFraction: 0.8,
        // scale: 0.9,
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
            style: TextStyle(fontSize: setScreen(type: 'size', value: 20))),
      );
    }
    if (weatherInfo == null) {
      return Container(
        // margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
        padding: EdgeInsets.only(top: 10.0),
        child: Text('/(ㄒoㄒ)/~~ 暂无数据...',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 20))),
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
            style: TextStyle(fontSize: setScreen(type: 'size', value: 20)),
          ),
        ]));
  }
}


//应用列表
class ApplicationGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var applications = [
      {
        'name': 'github',
        'icon': IconData(0xe885, fontFamily: 'iconfont'),
        'color': Colors.orange
      },
      {
        'name': 'blog',
        'icon': IconData(0xe8e8, fontFamily: 'iconfont'),
        'color': Colors.green
      },
      {
        'name': '快递查询',
        'icon': IconData(0xe603, fontFamily: 'iconfont'),
        'color': Colors.blue
      },
      {
        'name': '音乐排行榜',
        'icon': IconData(0xe600, fontFamily: 'iconfont'),
        'color': Colors.redAccent
      },
      {
        'name': '图片欣赏',
        'icon': IconData(0xe716, fontFamily: 'iconfont'),
        'color': Colors.blue
      },
      {
        'name': '实时段子',
        'icon': IconData(0xe607, fontFamily: 'iconfont'),
        'color': Colors.orange
      },
      {
        'name': '身份证识别',
        'icon': IconData(0xe605, fontFamily: 'iconfont'),
        'color': Colors.green
      },
      {
        'name': 'Map',
        'icon': IconData(0xe60a, fontFamily: 'iconfont'),
        'color': Colors.orange
      },
      {
        'name': '自定义',
        'icon': IconData(0xe67e, fontFamily: 'iconfont'),
        'color': Colors.red
      },
      {
        'name': '扫一扫',
        'icon': IconData(0xe60d, fontFamily: 'iconfont'),
        'color': Colors.green
      },
      {
        'name': '更多应用',
        'icon': IconData(0xe792, fontFamily: 'iconfont'),
        'color': Colors.blue
      },
    ];
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('功能应用',
                    style: TextStyle(
                        fontSize: setScreen(type: 'size', value: 35.0),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left)),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(), //去除内部滚动
              itemCount: applications.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 4,
                  //纵轴间距
                  mainAxisSpacing: 10.0,
                  //横轴间距
                  crossAxisSpacing: 10.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1)),
                  child: _applicationItem(applications[index], context),
                );
              },
            )
          ],
        ));
  }
}

Widget _applicationItem(item, context) {
  return Container(
      child: InkWell(
    onTap: () {
      Navigator.of(context).pushNamed('git_page', arguments: null); //注意2
      // PageRouter.router.navigateTo(context, "/git-repos");
      // Navigator.pushNamed(context, "git");
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Icon(
              item['icon'],
              color: Colors.white,
              size: setScreen(type: 'size', value: 50),
            ),
            color: item['color'],
            width: setScreen(type: 'w', value: 100.0),
            height: setScreen(type: 'h', value: 100.0),
          ),
        ),
        Container(
          child: Text(
            '${item['name']}',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 20)),
          ),
        )
      ],
    ),
  ));
}