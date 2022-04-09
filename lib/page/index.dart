
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/search/search.dart';
import 'package:provider/provider.dart';

import '../constant/custom_icons.dart';
import '../provider/navigation_bar.dart';
import 'home/home.dart';

/// 使用ios风格底部tab脚手架
class AppIndex extends StatelessWidget {
  static final  List _tabs = [
    {'icon': CustomIcons.home, 'text': '首页'},
    {'icon': CustomIcons.service, 'text': '精选'},
    {'icon': CustomIcons.search, 'text': '搜索'},
    {'icon': CustomIcons.cart, 'text': '购物车'},
    {'icon': CustomIcons.people, 'text': '账户'}
  ];

  /// 底部菜单对应页面
  static final List<Widget> _pages = [
    const Home(title: '首页',),
    const Home(title: '精选'),
    const Search(),
    const Home(title: '购物车'),
    const Home(title: '账户'),
  ];
  
  const AppIndex({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CupertinoTabController cupertinoTabController = Provider.of<NavigationBarProvider>(context, listen: false).cupertinoTabController;

    return CupertinoTabScaffold(
        controller: cupertinoTabController,
        tabBar: CupertinoTabBar(
          activeColor: Theme.of(context).primaryColor,
          items: _tabs.map((tab) => BottomNavigationBarItem(
              icon: Icon(tab['icon']),
              label: tab['text'])).toList(),
          onTap: (int index){
            // print(cupertinoTabController);
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          //
          return _pages[index];
        }
    );
  }
}
