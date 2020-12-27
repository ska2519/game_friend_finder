import 'package:firebase_core/firebase_core.dart';
import 'package:game_friend_finder/app/top_level_providers.dart';
import 'package:game_friend_finder/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:game_friend_finder/app/home/home_page.dart';
import 'package:game_friend_finder/routing/app_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //비동기 데이터 처리 시
  await Firebase.initializeApp();
  final sharedPreferences =
      await SharedPreferences.getInstance(); //To initialize FlutterFire
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = context.read(firebaseAuthProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFF1E3C4),
        accentColor: const Color(0xFF4A433B),
        fontFamily: 'Nanum',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) =>
          AppRouter.onGenerateRoute(settings, firebaseAuth),
    );
  }
}
