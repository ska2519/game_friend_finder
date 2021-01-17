import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:game_friend_finder/app/home/profile/create_profile_page.dart';
import 'package:game_friend_finder/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/app_router.dart';
import 'app/home/home_page.dart';
import 'app/home/sign_in/sign_in_page.dart';
import 'app/auth_widget.dart';
import 'app/onboarding/onboarding_view_model.dart';
import 'app/onboarding/onboarding_page.dart';
import 'services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //비동기 데이터 처리 시
  await Firebase.initializeApp(); //To initialize FlutterFire

  final sharedPreferences = await SharedPreferences.getInstance();
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
    return MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   const Locale('ko'),
      // ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        fontFamily: 'Nanum',
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (context, watch, _) {
            final didCompleteOnboarding =
                watch(onboardingViewModelProvider.state);
            return didCompleteOnboarding ? SignInPage() : OnboardingPage();
          },
        ),

        //TODO: user.userporfile == null 이면 setting Profile Page else HomePage()

        signedInBuilder: (_) => CreateProfilePage(),
      ),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
    );
  }
}
