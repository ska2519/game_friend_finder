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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
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
  void initState() {
    _tabController = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: _selectedIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.grey[50],
        bottom: TabBar(
          controller: _tabController,
          onTap: _onItemTapped,
          labelColor: Color(0xFFFE3C72),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          tabs: [
            _buildItem(TabItem.swipe),
            _buildItem(TabItem.like),
            _buildItem(TabItem.chat),
            _buildItem(TabItem.account),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
    );
  }

  Tab _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    return Tab(icon: Icon(itemData.icon));
  }
}
