import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'app/home/home_page.dart';
import 'routing/app_router.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized(); //비동기 데이터 처리 시
  await Firebase.initializeApp();
  final sharedPreferences =
      await SharedPreferences.getInstance(); //To initialize FlutterFire
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFF1E3C4),
        accentColor: const Color(0xFF4A433B),
        fontFamily: 'Nanum',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
    );
  }
}
