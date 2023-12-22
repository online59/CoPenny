import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/shared/presentation/screens/account_page.dart';
import 'package:piggy/shared/presentation/screens/overview_page.dart';
import 'package:piggy/shared/presentation/screens/summary_page.dart';
import 'package:piggy/shared/presentation/screens/spending_page.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key, required this.walletId});

  final String walletId;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    setState(() {
      FirebaseAuth.instance.signOut();
    });
  }

  int _bottomNavIndex = 0;

  late PageController _pageController;

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

  void _onPageChanged(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          const OverviewPage(),
          SpendingPage(walletId: widget.walletId),
          const SummaryPage(),
          const AccountPage()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(90.0),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.list, Icons.pie_chart, Icons.person],
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          _onPageChanged(index);
          _pageController.jumpToPage(index);
        },
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
