import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/add_transaction/add_transaction_screen.dart';
import 'package:piggy/src/features/core/screen/balance/wallet_balance_screen.dart';
import 'package:piggy/src/features/core/screen/account/account_screen.dart';
import 'package:piggy/src/features/core/screen/news/dashboard_screen.dart';
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
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletProvider>(
        create: (BuildContext context) => WalletProvider(),
        child: SafeArea(
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
              controller: _pageController,
              onPageChanged: _onTapSelected,
              children: const [
                DashboardScreen(),
                TransactionOrWalletScreen(),
                WalletBalanceScreen(),
                AccountScreen(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {

              },
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
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const TransactionBottomSheetWidget(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }


  void _onTapSelected(int index) {
    setState(() {
      _currentTab = index;
      _pageController.jumpToPage(index);

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
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
