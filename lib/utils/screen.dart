import 'package:flutter_screenutil/flutter_screenutil.dart';

setScreen({String type, double value, contxt}) {
  switch (type) {
    case 'w':
      return ScreenUtil.getInstance().setWidth(value);
      break;
    case 'h':
      return ScreenUtil.getInstance().setHeight(value);
      break;
    case 'size':
      return ScreenUtil.getInstance().setSp(value);
      break;
    default:
      return value;
  }
}

getScreenWidth(){
  return ScreenUtil.screenWidth ;
}
getStatusBarHeight(){//获取状态栏高度
  return ScreenUtil.statusBarHeight;
}
