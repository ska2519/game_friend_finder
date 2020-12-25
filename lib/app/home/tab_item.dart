import 'package:flutter/material.dart';
import 'package:game_friend_finder/constants/keys.dart';
import 'package:game_friend_finder/constants/strings.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

enum TabItem { swipe, like, chat, account }

class TabItemData {
  const TabItemData({
    @required this.key,
    @required this.label,
    @required this.icon,
  });

  final String key;
  final String label;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.swipe: TabItemData(
      key: Keys.swipeTab,
      label: Strings.swipe,
      icon: LineAwesomeIcons.burn,
    ),
    TabItem.like: TabItemData(
      key: Keys.likeTab,
      label: Strings.like,
      icon: LineAwesomeIcons.heartbeat,
    ),
    TabItem.chat: TabItemData(
      key: Keys.likeTab,
      label: Strings.like,
      icon: LineAwesomeIcons.comments,
    ),
    TabItem.account: TabItemData(
      key: Keys.accountTab,
      label: Strings.account,
      icon: LineAwesomeIcons.user_1,
    ),
  };
}
