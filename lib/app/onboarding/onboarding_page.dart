import 'package:custom_buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboarding_view_model.dart';

class OnboardingPage extends StatelessWidget {
  Future<void> onGetStarted(BuildContext context) async {
    final onboardingViewModel = context.read(onboardingViewModelProvider);
    await onboardingViewModel.completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '게임친구찾기에 오신것을 환영합니다.',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Text(
              '아래의 이용 규정을 반드시 지켜 주세요.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              '자신을 솔직하게 보여주기.',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              '본인의 사진, 나이, 자기소개를 솔직하게 올려주세요.',
              style: Theme.of(context).textTheme.bodyText2,
            ), Text(
              '아래의 이용 규정을 반드시 지켜 주세요.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: SvgPicture.asset('assets/time-tracking.svg',
                  semanticsLabel: 'Time tracking logo'),
            ),
            CustomRaisedButton(
              onPressed: () => onGetStarted(context),
              color: Colors.indigo,
              borderRadius: 30,
              child: Text(
                'Get Started',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
