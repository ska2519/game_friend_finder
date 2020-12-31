import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:alert_dialogs/alert_dialogs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_friend_finder/app/home/sign_in/social_sign_in_button.dart';
import 'package:game_friend_finder/app/top_level_providers.dart';
import 'package:game_friend_finder/constants/strings.dart';

import 'sign_in_view_model.dart';

final signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
  (ref) => SignInViewModel(auth: ref.watch(firebaseAuthProvider)),
);

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final signInModel = watch(signInModelProvider);
    return ProviderListener<SignInViewModel>(
      provider: signInModelProvider,
      onChange: (context, model) async {
        if (model.error != null) {
          await showExceptionAlertDialog(
            context: context,
            title: Strings.signInFailed,
            exception: model.error,
          );
        }
      },
      child: SignInPageContents(
        viewModel: signInModel,
      ),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents({
    Key key,
    this.viewModel,
  }) : super(key: key);
  final SignInViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      Strings.gameFrindFinder,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: min(constraints.maxWidth, 600),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32.0),
              SizedBox(
                height: 50.0,
                child: _buildHeader(),
              ),
              const SizedBox(height: 99.0),
              _informationLoginText(context),
              const SizedBox(height: 32.0),
              SocialSignInButton(
                assetName: 'images/google-logo.png',
                text: 'Google 계정으로 로그인',
                textColor: Colors.black87,
                color: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithGoogle,
              ),
              const SizedBox(height: 18),
            ],
          ),
        );
      }),
    );
  }

  Text _informationLoginText(BuildContext context) {
    return Text.rich(
        TextSpan(
          text: ('로그인을 누르시면 '),
          children: [
            TextSpan(
                text: ('이용약관'),
                style: TextStyle(decoration: TextDecoration.underline)),
            TextSpan(text: '에 동의하는 것으로 간주됩니다. 게임친구찾기의 '),
            TextSpan(
                text: '개인정보 취급방침',
                style: TextStyle(decoration: TextDecoration.underline)),
            TextSpan(text: ' 및 '),
            TextSpan(
                text: '쿠키정책',
                style: TextStyle(decoration: TextDecoration.underline)),
            TextSpan(text: '에서 회원 정보 처리 방법을 확인하실 수 있습니다.'),
          ],
        ),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2);
  }
}
