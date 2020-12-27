import 'package:email_password_sign_in_ui/email_password_sign_in_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_friend_finder/app/home/account/account_page.dart';
import 'package:game_friend_finder/app/home/chat/chat_page.dart';
import 'package:game_friend_finder/app/home/like/like_page.dart';
import 'package:game_friend_finder/app/home/swipe/swipe_page.dart';

class AppRoutes {
  static const emailPasswordSignInPage = '/email-password-sign-in-page';
  static const swipePage = '/swipe-page';
  static const likePage = '/like-page';
  static const chatPage = '/chat-page';
  static const accountPage = '/account-page';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(
      RouteSettings settings, FirebaseAuth firebaseAuth) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.emailPasswordSignInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EmailPasswordSignInPage.withFirebaseAuth(firebaseAuth,
              onSignedIn: args),
          settings: settings,
          fullscreenDialog: true,
        );
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
