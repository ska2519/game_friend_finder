import 'package:flutter/material.dart';
import 'package:game_friend_finder/constants/keys.dart';
import 'package:game_friend_finder/constants/strings.dart';
import 'package:game_friend_finder/services/auth_service.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../top_level_providers.dart';

class AccountPage extends StatelessWidget {
  // Future<void> _signOut(BuildContext context, FirebaseAuth firebaseAuth) async {
  //   try {
  //     await firebaseAuth.signOut();
  //   } catch (e) {
  //     showExceptionAlertDialog(
  //       context: context,
  //       title: Strings.logoutFailed,
  //       exception: e,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            FlatButton(
              key: const Key(Keys.logout),
              child: const Text(
                Strings.logout,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            Center(
              child: RaisedButton(
                  child: Text('Temp Logout Button'),
                  onPressed: () => AuthService().signOut()),
            ),
          ],
        ),
      ),
    );
  }
}
