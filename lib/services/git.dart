import 'package:dio/dio.dart';
import 'package:my_flutter/utils/request.dart';
import 'package:my_flutter/models/git/repos.dart';
class GitService{
  static Future getGitRepos({page,size}) async{
    print(page);
    Response response = await HttpUtil().dio.get("/users/weizhanzhan/repos?page=$page&per_page=$size");
     List<GitRepos> res = [];
     response.data.forEach((item){
       res.add(GitRepos.fromJson(item));
     });
    return res;
  }
  static Future getGitEvent({page,size}) async{
    print(page);
    Response response = await HttpUtil().dio.get("/users/weizhanzhan/repos?page=$page&per_page=$size");
     List<GitRepos> res = [];
     response.data.forEach((item){
       res.add(GitRepos.fromJson(item));
     });
    return res;
  }
}