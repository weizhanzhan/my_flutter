import 'package:flutter/material.dart';
import 'package:my_flutter/utils/request.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _repos = [];
  bool _weatherLoading = false;
  Object _weather;

  @override
  void initState() {
    super.initState();
    _getReposData();
    _getWeatherData();
  }

  _getReposData() {
    getRepos().then((repos) {
      setState(() {
        _repos = repos.data;
      });
    });
  }

  _getWeatherData() {
    setState(() {
      _weatherLoading = true;
    });
    getWeather().then((weather) {
      setState(() {
        _weatherLoading = false;
        _weather = weather.data;
      });
    }).catchError((e) {
      setState(() {
        _weatherLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _headerTitle(),
          _headerImg(),
          _weatherBody(_weather, _weatherLoading),
          _applicationGrid(),
          // _repos.length != 0 ? _bodyContext(_repos) : Text('空数组')
        ],
      ),
    )));
  }
}

// 头部标题
Widget _headerTitle() {
  return Container(
    padding: EdgeInsets.fromLTRB(24, 12, 24, 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Learn and live!',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(right: 10),
            //   child: Icon(Icons.add, size: 30),
            // ),
            Icon(IconData(0xe70a, fontFamily: 'iconfont'), size: 30)
          ],
        )
      ],
    ),
  );
}

// 头部banner
Widget _headerImg() {
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
        // return new Image.asset(
        //   imgs[index],
        //   fit: BoxFit.fill,
        // );
        return ClipRRect(
          child: Image.asset(imgs[index], fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
        );
      },
      itemCount: imgs.length,
      pagination: new SwiperPagination(),
      // control: new SwiperControl(),
    ),
  );
  // child: ClipRRect(
  //   child: Image.asset('assets/img/banner1.jpg', fit: BoxFit.cover),
  //   borderRadius: BorderRadius.circular(8),
  // ));
}

// 天气
Widget _weatherBody(weather, loading) {
  if (loading) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text('ε=( o｀ω′)ノ 正在加载...'),
    );
  }
  if (weather == null) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Text('/(ㄒoㄒ)/~~ 暂无数据...'),
    );
  }
  var now = weather['data']['forecast'][0];
  return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
      margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(children: <Widget>[
        Icon(
          IconData(0xe7db, fontFamily: 'iconfont'),
          size: 20,
        ),
        Text(
            '  ${now['date']} ${weather['data']['city']}   ${now['type']}   ${now['high']}   ${now['low']}'),
      ]));
}

// 应用表格
Widget _applicationGrid() {
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
    // {
    //   'name': '音乐排行榜',
    //   'icon': IconData(0xe600, fontFamily: 'iconfont'),
    //   'color': Colors.redAccent
    // },
    // {
    //   'name': '音乐排行榜',
    //   'icon': IconData(0xe600, fontFamily: 'iconfont'),
    //   'color': Colors.redAccent
    // },
    // {
    //   'name': '音乐排行榜',
    //   'icon': IconData(0xe600, fontFamily: 'iconfont'),
    //   'color': Colors.redAccent
    // }
  ];
  return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('功能应用',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left)),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(), //去除内部滚动
            itemCount: applications.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 4,
                //纵轴间距
                mainAxisSpacing: 20.0,
                //横轴间距
                crossAxisSpacing: 10.0,
                //子组件宽高长度比例
                childAspectRatio: 1.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: _applicationItem(applications[index]),
              );
            },
          )
        ],
      ));
}

Widget _applicationItem(item) {
  return Container(
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
          child: Text('${item['name']}'),
        )
      ],
    ),
  );
}

// 数据列表
Widget _bodyContext(repos) {
  return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), //去除内部滚动
        itemCount: repos.length,
        // itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(repos[index]['name']),
            subtitle: Text(
              repos[index]['description'].toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(Icons.games),
          );
        },
      ));
}
