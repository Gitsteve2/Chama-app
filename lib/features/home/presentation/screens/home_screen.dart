import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import '../widgets/lighted_background.dart';
import '../widgets/page_indicators.dart';
import '../widgets/accounts_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> accountSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    controller.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        // appBar: const ShAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 45),
              Text(
                "Manage Your Accounts and Cards",
                style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'paypal',
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              // Text(
              //   "ACCOUNTS",
              //   style: TextStyle(
              //       fontSize: 17,
              //       // color: Color(0xFFa52b29),
              //       fontWeight: FontWeight.w700),
              // ),
              height32,
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    AccountsPageView(
                      pageNotifier: pageNotifier,
                      accountSelectorNotifier: accountSelectorNotifier,
                      controller: controller,
                    ),
                    Positioned.fill(
                      top: null,
                      child: Column(
                        children: [
                          PageIndicators(
                            accountSelectorNotifier: accountSelectorNotifier,
                            pageNotifier: pageNotifier,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
