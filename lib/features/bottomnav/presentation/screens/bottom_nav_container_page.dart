import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/shared/presentation/screens/account_page.dart';
import 'package:piggy/shared/presentation/screens/overview_page.dart';
import 'package:piggy/shared/presentation/screens/summary_page.dart';
import 'package:piggy/shared/presentation/screens/transaction_page.dart';

class BottomNavContainer extends StatefulWidget {
  const BottomNavContainer({super.key});

  @override
  State<BottomNavContainer> createState() => _BottomNavContainerState();
}

class _BottomNavContainerState extends State<BottomNavContainer> {

  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    setState(() {
      FirebaseAuth.instance.signOut();
    });
  }

  int _bottomNavIndex = 0;

  List<Widget> screens = const [OverviewPage(), TransactionPage(), SummaryPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: screens[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0))
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.list, Icons.pie_chart, Icons.person],
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
