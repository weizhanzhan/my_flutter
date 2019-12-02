import 'package:fish_redux/fish_redux.dart';
import 'package:my_flutter/views/git_page/repos_page/state.dart';

//TODO replace with your own action
enum ReposAction { init,fetchSuccess,onRefresh ,onFetch,}

class ReposActionCreator {


  static Action onRefresh() {
    return Action(ReposAction.onRefresh);
  }
  static Action onFetch({bool reset = false}){
    return Action(ReposAction.onFetch,payload: {  'reset':reset  });
  }

  static Action onFetchSuccess(list, {bool reset = false}) {
    return Action(ReposAction.fetchSuccess, payload: {'list':list, 'reset': reset});
  }
  
}
