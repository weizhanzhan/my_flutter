import 'package:flutter/material.dart';
import 'package:my_flutter/utils/request.dart';
import 'package:my_flutter/utils/screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _repos = [];

  @override
  void initState() {
    super.initState();
    _getReposData();
  }

  _getReposData() {
    getRepos().then((repos) {
      setState(() {
        _repos = repos.data;
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
          _repos.length != 0 ? _bodyContext(_repos) : Text('空数组')
        ],
      ),
    )));
  }
}

Widget _headerTitle() {
  return Container(
    decoration: BoxDecoration(
        // border: new Border(
        //   bottom: BorderSide(
        //     color: Colors.blueAccent,
        //     width: 0
        //   )
        // ), // 边色与边宽度
        ),
    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Hello,Welcome !',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.add, size: 30),
            ),
            Icon(Icons.description, size: 30)
          ],
        )
      ],
    ),
  );
}

Widget _headerImg() {
  return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
      width: double.infinity,
      height: setScreen(type: 'h', value: 240),
      child: ClipRRect(
        child: Image.asset('assets/img/banner.jpg', fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ));
}

Widget _bodyContext(repos) {
  print('我接受到的数据');
  print(repos);
  return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), //去除内部滚动
        itemCount: repos.length,
        // itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {
          print(repos[index]['name']);
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
      )
      //     child: ListView(
      //   physics: NeverScrollableScrollPhysics(), //去除内部滚动
      //   shrinkWrap: true,
      //   children: <Widget>[
      //     ListTile(
      //       title: Text('Flutter Image组件'),
      //       subtitle: Text(
      //         '目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //       leading: Icon(Icons.settings),
      //     ),
      //     ListTile(
      //       title: Text('Flutter Container 组件'),
      //       subtitle: Text(
      //         '目录 参数详解 代码示例 效果图 完整代码 Container 官网简介：一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。 其实就是一个容器组件，既然是容器，那么，就一定可以装很多东西，而Container装的东西就是Flutter 其他组件。 参数详解 属性 说明',
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //       leading: Icon(Icons.settings),
      //     ),
      //   ],
      // ));
      );
}

// class HomePage extends StatefulWidget {

//   List repos = new List();

//   @override
//   Widget build(BuildContext context) {

//     getRepos().then((repos){
//       print(repos);
//     });

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               _headerTitle(),
//               _headerImg(),
//               _bodyContext()
//             ],
//           ),
//         )
//       )
//     );
//   }
// }
