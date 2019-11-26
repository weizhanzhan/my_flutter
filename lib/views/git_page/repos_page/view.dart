import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ReposState state, Dispatch dispatch, ViewService viewService) {
  print('页面开始加载');
  print(state.list);

 return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: ListView.builder(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(), //去除内部滚动
        itemCount: state.list.length,
        // itemExtent: 50.0,
        itemBuilder: (BuildContext context, int index) {

          return ListTile(
            title: Text(state.list[index].name),
            subtitle: Text(
              state.list[index].description.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: Icon(Icons.games),
          );
        },
      ));
}
