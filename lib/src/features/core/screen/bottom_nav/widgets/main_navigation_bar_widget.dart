import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/%E0%B8%B4budget/budget_screen.dart';
import 'package:piggy/src/features/core/screen/user_account/account_screen.dart';
import 'package:piggy/src/features/core/screen/dashboard/dashboard_screen.dart';
import 'package:piggy/src/features/core/screen/transaction/widgets/transaction_or_wallet.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class MainNavigationBarWidget extends StatefulWidget {
  const MainNavigationBarWidget({super.key});

  @override
  State<MainNavigationBarWidget> createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState extends State<MainNavigationBarWidget> {
  int _currentTab = 0;
  String _currentTitle = mDashboardScreenTitle;
  late PageController _screenController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
      create: (BuildContext context) => WalletProvider(),
      child: Consumer<WalletProvider>(builder: (context, provider, child) {
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
              onPageChanged: _onTapSelected,
              children: [
                const DashboardScreen(),
                TransactionOrWalletScreen(
                  walletProvider: provider,
                ),
                const BudgetScreen(),
                const SettingScreen(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add_rounded),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              onTap: (index) {
                // _onTapSelected(index);
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
      }),
    );
  }

  void _onTapSelected(int index) {
    setState(() {
      _currentTab = index;
      _screenController.jumpToPage(index);

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
    });
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
