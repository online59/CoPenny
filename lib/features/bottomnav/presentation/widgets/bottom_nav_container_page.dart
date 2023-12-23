import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/features/add_transaction/data/service/firestore_service.dart';
import 'package:piggy/features/transaction/data/datasource/transaction_data.dart';
import 'package:piggy/shared/presentation/screens/account_page.dart';
import 'package:piggy/shared/presentation/screens/overview_page.dart';
import 'package:piggy/shared/presentation/screens/summary_page.dart';
import 'package:piggy/shared/presentation/screens/spending_page.dart';
import 'package:uuid/uuid.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

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

  final List<Widget> _pages = [
    const OverviewPage(),
    const SpendingPage(),
    const SummaryPage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    var dataSource = TransDataSource();
    var listItem = dataSource.generateDummyTransaction('1');

    Random random = Random();

    FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int index = random.nextInt(listItem.length - 1);
          firestoreService.writeDataToFirestore(firestoreService.getPath(listItem[index]), listItem[index]);
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(90.0),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
      icons: const [Icons.home, Icons.list, Icons.pie_chart, Icons.person],
      activeIndex: _bottomNavIndex,
      onTap: (index) {
        _onPageChanged(index);
        _pageController.jumpToPage(index);
      },
      notchSmoothness: NotchSmoothness.softEdge,
      gapLocation: GapLocation.center,
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}
