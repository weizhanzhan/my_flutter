import 'package:dio/dio.dart';
import 'package:my_flutter/models/git/repos.dart';
class GitService{
  static Future getGitRepos() async{
    Response response = await Dio().get("https://api.github.com/users/weizhanzhan/repos");
     List<GitRepos> res = [];
     response.data.forEach((item){
       res.add(GitRepos.fromJson(item));
     });
     print(res);
    //  res.map((item){
    //    return GitRepos.fromJson(item);
    //  });
    return res;
  }
}