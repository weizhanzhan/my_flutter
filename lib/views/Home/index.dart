import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/utils/request.dart';
import 'package:my_flutter/utils/screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:my_flutter/router/page_router.dart';

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
    ScreenUtil.instance =  ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);
  
    return Scaffold(
       backgroundColor: Colors.white,//Color(0xFFF2F3F8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[ 
 
                HeaderTitle(),
                HeaderSwiper(),
                WeatherBox( 
                  weatherInfo: _weather,
                  loading: _weatherLoading,
                ),
                DirverLine(),
                ApplicationGrid(),
              // _repos.length != 0 ? _bodyContext(_repos) : Text('空数组')
            ],
          ),
    )));
  }
}
// 隔断线

class DirverLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       Container(
         margin: EdgeInsets.only(top: 20),
         width: getScreenWidth(),
         height: setScreen(type:'h',value:20),
         decoration: BoxDecoration(
           color: Color.fromRGBO(246, 246, 246, 1),
         ),
         
         
     
    );
  }
}
// 头部标题
class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Hi，早上好',
             style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: setScreen(type: 'size', value: 32.0),
                letterSpacing: 0.5,
                color:Colors.black// Color(0xFF4A6572),
              ),
            // style: TextStyle(
            //     fontSize: setScreen(type: 'size', value: 35.0),
            //     fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Icon(IconData(0xe70a, fontFamily: 'iconfont'),
                  size: setScreen(type: 'size', value: 45.0))
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
      'assets/img/b6.jpg',
      'assets/img/banner3.jpg',
      
      'assets/img/banner4.jpg',
      'assets/img/banner5.jpg',
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(24,24, 24,24),
      width: double.infinity,
      height: setScreen(type: 'h', value: 250),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: Image.asset(imgs[index], fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          );
        },
        itemCount: imgs.length,
         // viewportFraction: 0.8,
        // scale: 0.9,//这个的效果是直接显示三个 中间的最大占主屏
        // pagination: new SwiperPagination(),
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
            style: TextStyle(fontSize: setScreen(type: 'size', value: 25))),
      );
    }
    if (weatherInfo == null) {
      return Container(
        // margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
        padding: EdgeInsets.only(top: 10.0),
        child: Text('/(ㄒoㄒ)/~~ 暂无数据...',
            style: TextStyle(fontSize: setScreen(type: 'size', value: 25))),
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
            style: TextStyle(fontSize: setScreen(type: 'size', value: 25)),
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
        padding: EdgeInsets.only(left: 12, right: 12, top: 10),
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
                  // decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white, width: 1)),
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
            style: TextStyle(fontSize: setScreen(type: 'size', value: 25)),
          ),
        )
      ],
    ),
  ));
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


class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center( //保证控件居中效果
        child: new SizedBox(
          width: 120.0,
          height: 120.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(
                    text,
                    style: new TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}