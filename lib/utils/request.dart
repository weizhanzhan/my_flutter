import 'package:dio/dio.dart';

Future getRepos() async{
  Response response = await Dio().get("https://api.github.com/users/weizhanzhan/repos");
  return response;
}


Future getWeather() async{
  Response response = await Dio().get("https://www.apiopen.top/weatherApi?city=常州");
  return response;
}