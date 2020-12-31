import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:game_friend_finder/services/auth_service.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({@required this.auth});
  final FirebaseAuth auth;
  final AuthService authService = AuthService();
  bool isLoading = false;
  dynamic error;

  Future<void> _signIn(Future<AppUser> Function() signInMethod) async {
    try {
      isLoading = true;
      notifyListeners();
      await signInMethod();
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    await _signIn(authService.signInWithGoogle);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
