import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/features/add_transaction/data/service/firestore_service.dart';
import 'package:piggy/src/features/core/screen/user_account/account_screen.dart';
import 'package:piggy/src/features/core/screen/dashboard/dashboard_screen.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_directing_screen.dart';
import 'package:piggy/src/features/core/screen/summary/summary_screen.dart';
import 'package:piggy/src/features/transaction/controller/datasource/transaction_data.dart';

class CoreContainerScreen extends StatefulWidget {
  const CoreContainerScreen({super.key});

  @override
  State<CoreContainerScreen> createState() => _CoreContainerScreenState();
}

class _CoreContainerScreenState extends State<CoreContainerScreen> {
  final user = FirebaseAuth.instance.currentUser;

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
    var listItem = TransDataSource().generateDummyTransaction('1');
    Random random = Random();
    FirestoreService firestoreService = FirestoreService();

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: const [
            TransactionDirectingScreen(),
            Dashboard(),
            SummaryPage(),
            AccountPage()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            int index = random.nextInt(listItem.length - 1);
            firestoreService.writeDataToFirestore(
                firestoreService.getPath(listItem[index]), listItem[index]);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            Icons.list_alt_rounded,
            Icons.pie_chart_rounded,
            Icons.notifications_rounded,
            Icons.account_circle,
          ],
          activeIndex: _bottomNavIndex,
          onTap: (index) {
            _onPageChanged(index);
            _pageController.jumpToPage(index);
          },
          notchSmoothness: NotchSmoothness.softEdge,
          gapLocation: GapLocation.center,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
