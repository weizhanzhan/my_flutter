import 'package:dio/dio.dart';

Future getRepos() async{
  Response response = await Dio().get("https://api.github.com/users/weizhanzhan/repos");
  return response;
}