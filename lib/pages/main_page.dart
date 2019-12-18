import 'package:code_viewer/pages/code_page.dart';
import 'package:code_viewer/pages/my_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages;
  List<BottomNavigationBarItem> itemList;
  final itemNames = [
    _Item('首页', 'assets/images/ic_tab_code_active.png',
        'assets/images/ic_tab_code_normal.png'),
    _Item('我的', 'assets/images/ic_tab_my_active.png',
        'assets/images/ic_tab_my_normal.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("hello world"));
  }

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [CodeHomePage(), MyPage()];
    }
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
