import 'package:flutter/material.dart';
import 'package:game_friend_finder/app/home/account/account_page.dart';
import 'package:game_friend_finder/app/home/chat/chat_page.dart';
import 'package:game_friend_finder/app/home/like/like_page.dart';
import 'package:game_friend_finder/app/home/swipe/swipe_page.dart';

class AppRoutes {
  static const swipePage = '/swipe-page';
  static const likePage = '/like-page';
  static const chatPage = '/chat-page';
  static const accountPage = '/account-page';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.swipePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SwipePage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.likePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LikePage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.chatPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ChatPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.accountPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AccountPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
