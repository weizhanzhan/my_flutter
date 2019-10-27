import 'package:flutter/material.dart';
import '../../utils/screen.dart';
import '../../utils/request.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List repos = [];
 
  @override
  void initState() {
    print(123);
    getRepos().then((repos){
       print(repos);
      repos = repos;
     
    });
    super.initState();
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
              _bodyContext(repos)
            ],
          ),
        )
      )
    );
  }
}
Widget _headerTitle(){
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
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.add,size:30),
            ),
            Icon(Icons.description,size:30)
          ],
        )
      
      ],
    ),
  );
}
Widget _headerImg(){
  var img = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572168819700&di=e7848d74a1a24a2d0ac2a5e344647597&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F358f1e0d1134aa0291bccc2cef3fa8e8dde2f5cd9645-YkoZwc_fw658';
  return Container(
    margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
    width: double.infinity,
    height:setScreen(type: 'h',value: 240),
    child: ClipRRect(
      child:Image.network(img,fit: BoxFit.cover,) ,
      borderRadius: BorderRadius.circular(10),
    )
  );
}
Widget _bodyContext(repos){
  print(repos);
  return Container(
    child:ListView(
      physics: NeverScrollableScrollPhysics(), //去除内部滚动
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text('Flutter Image组件'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 使用资源图片前必做两个步骤： 1、在根目录下创建子目录，子目录中创建2.0x和3.0x（也可以创建4.0x、5.0x... 但是2.0和3.0是必须的）目录，在对应目录中添加对应分辨率图片。（图1） 2、打开pubspec.yaml文件',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Icon(Icons.settings),
        ),
 
        ListTile(
          title: Text('Flutter Container 组件'),
          subtitle: Text('目录 参数详解 代码示例 效果图 完整代码 Container 官网简介：一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。 其实就是一个容器组件，既然是容器，那么，就一定可以装很多东西，而Container装的东西就是Flutter 其他组件。 参数详解 属性 说明',maxLines: 2,overflow: TextOverflow.ellipsis,),
          leading: Icon(Icons.settings),
        ),
      ],
    )
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