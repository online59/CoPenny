import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/balance/wallet_balance_screen.dart';
import 'package:piggy/src/features/core/screen/news/dashboard_screen.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_screen.dart';
import 'package:piggy/src/features/core/screen/account/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  String _currentTitle = mDashboardScreenTitle;

  late PageController _screenController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(_currentTitle),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: mAppBarVMargin, horizontal: mAppBarHMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mButtonRadiusSmall),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.wallet_rounded),
              ),
            )
          ],
        ),
        body: PageView(
          controller: _screenController,
          onPageChanged: (index) {
            debugPrint(index.toString());
          },
          children: const [
            DashboardScreen(),
            TransactionScreen(),
            WalletBalanceScreen(),
            AccountScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_rounded),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentTab = index;
              _screenController.jumpToPage(_currentTab);
              setScreenTitle(index);
            });
          },
          icons: const [
            Icons.home_rounded,
            Icons.list_alt_rounded,
            Icons.pie_chart_rounded,
            Icons.settings_rounded,
          ],
          activeIndex: _currentTab,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  void setScreenTitle(int index) {
    switch (index) {
      case 0:
        {
          _currentTitle = mDashboardScreenTitle;
        }
        break;
      case 1:
        {
          _currentTitle = mTransactionScreenTitle;
        }
        break;
      case 2:
        {
          _currentTitle = mBudgetScreenTitle;
        }
        break;
      case 3:
        {
          _currentTitle = mSettingScreenTitle;
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _screenController = PageController();
  }

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }
}
