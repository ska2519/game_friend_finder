import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:game_friend_finder/app/top_level_providers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class AppUser {
  const AppUser({
    @required this.uid,
    this.email,
    this.photoURL,
    this.displayName,
  }) : assert(uid != null, 'User can only be created with a non-null uid');
  final String uid;
  final String email;
  final String photoURL;
  final String displayName;

  factory AppUser.fromFirebaseUser(User user) {
    if (user == null) return null;

    return AppUser(
      uid: user.uid,
      email: user.email,
      photoURL: user.photoURL,
      displayName: user.displayName,
    );
  }
  @override
  String toString() =>
      'uid: $uid, email: $email, photoUrl: $photoURL, displayName: $displayName';
}

final container = ProviderContainer();

class AuthService {
  final FirebaseAuth _firebaseAuth = container.read(firebaseAuthProvider);
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AppUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    if (googleUser != null) {
      // Create a credential from a Google Sign-in Request
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Attempt to sign in the user in with Google
        final authResult =
            await _firebaseAuth.signInWithCredential(googleAuthCredential);
        return AppUser.fromFirebaseUser(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  AppUser get currentUser =>
      AppUser.fromFirebaseUser(_firebaseAuth.currentUser);

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
