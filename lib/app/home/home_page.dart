import 'package:flutter/material.dart';
import 'swipe/swipe_page.dart';
import 'like/like_page.dart';
import 'chat/chat_page.dart';
import 'account/account_page.dart';

import 'tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final TabController _tabController;
  int _selectedIndex = 0;

  List<Widget> screens = [
    SwipePage(),
    LikePage(),
    ChatPage(),
    AccountPage(),
  ];

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.swipe: GlobalKey<NavigatorState>(),
    TabItem.like: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.account: GlobalKey<NavigatorState>(),
  };
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.black),

        //fixedColor: Colors.yellowAccent,
        selectedItemColor: Colors.redAccent,
        //unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        items: [
          _buildItem(TabItem.swipe),
          _buildItem(TabItem.like),
          _buildItem(TabItem.chat),
          _buildItem(TabItem.account),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(itemData.icon),
      label: itemData.label,
    );
  }
}
