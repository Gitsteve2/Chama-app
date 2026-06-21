import 'package:flutter/material.dart';

import '../../../../core/shared/domain/entities/account.dart';
import '../../../../core/shared/presentation/widgets/account_card.dart';
import '../../../account/screens/account_details_screen.dart';

class AccountsPageView extends StatelessWidget {
  const AccountsPageView({
    super.key,
    required this.pageNotifier,
    required this.accountSelectorNotifier,
    required this.controller,
  });

  final ValueNotifier<double> pageNotifier;
  final ValueNotifier<int> accountSelectorNotifier;
  final PageController controller;

  double _getOffsetX(double percent) => percent.isNegative ? 30.0 : -30.0;

  Matrix4 _getOutTranslate(double percent, int selected, int index) {
    final x = selected != index && selected != -1 ? _getOffsetX(percent) : 0.0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageNotifier,
      builder: (_, page, __) => ValueListenableBuilder(
        valueListenable: accountSelectorNotifier,
        builder: (_, selected, __) => PageView.builder(
          clipBehavior: Clip.none,
          itemCount: Account.fakeValues.length,
          controller: controller,
          itemBuilder: (_, index) {
            final percent = page - index;
            final isSelected = selected == index;
            final account = Account.fakeValues[index];
            return AnimatedContainer(
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              transform: _getOutTranslate(percent, selected, index),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AccountCard(
                percent: percent,
                expand: isSelected,
                accountName: account,
                onSwipeUp: () => accountSelectorNotifier.value = index,
                onSwipeDown: () => accountSelectorNotifier.value = -1,
                onTap: () async {
                  if (isSelected) {
                    await Navigator.push(
                      context,
                      PageRouteBuilder<void>(
                        transitionDuration: const Duration(milliseconds: 800),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 800),
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: AccountDetailScreen(account: account),
                        ),
                      ),
                    );
                    accountSelectorNotifier.value = -1;
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
