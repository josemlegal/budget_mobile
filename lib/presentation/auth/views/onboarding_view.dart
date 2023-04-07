import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class OnboardingView extends HookConsumerWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Onboarding'),
      ),
    );
  }
}
