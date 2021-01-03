import 'package:custom_buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/strings.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
                child: SvgPicture.asset('assets/time-tracking.svg',
                    semanticsLabel: 'Time tracking logo'),
              ),
              Text(
                '${Strings.gameFrindFinder}에 오신 것을\n환영합니다.',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '아래의 이용 규정을 반드시 지켜 주세요.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '자신을 솔직하게 보여주기',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '본인의 사진, 나이, 자기소개를 솔직하게 올려주세요.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '항상 조심하기',
                style: Theme.of(context).textTheme.headline6,
              ),
              CustomRaisedButton(
                onPressed: () => onGetStarted(context),
                color: Colors.indigo,
                textColor: Colors.white,
                borderRadius: 30,
                child: Text('동의합니다', style: TextStyle(fontSize: 23)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
