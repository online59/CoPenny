import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
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
  int _currentTab = 0;
  String _currentTitle = mDashboardScreenTitle;
  late PageController _screenController;

  @override
  Widget build(BuildContext context) {
    var transactionList = TransDataSource().generateDummyTransaction('1');
    Random random = Random();
    FirestoreService firestoreService = FirestoreService();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(mDefaultSize),
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: const Text(mAppName),
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: mAppBarVMargin, horizontal: mAppBarHMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mButtonRadius),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.wallet_rounded),
                ),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(mDefaultSize),
            child: PageView(
              controller: _screenController,
              onPageChanged: _onTapSelected,
              children: const [
                Dashboard(),
                TransactionDirectingScreen(),
                SummaryPage(),
                AccountPage(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              int index = random.nextInt(transactionList.length - 1);
              firestoreService.writeDataToFirestore(
                  firestoreService.getPath(transactionList[index]),
                  transactionList[index]);
            },
            child: const Icon(Icons.add_rounded),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            onTap: (index) {
              _onTapSelected(index);
            },
            icons: const [
              Icons.list_alt_rounded,
              Icons.pie_chart_rounded,
              Icons.notifications_rounded,
              Icons.account_circle,
            ],
            activeIndex: _currentTab,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
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
            _currentTitle = mSummaryScreenTitle;
          }
          break;
        case 3:
          {
            _currentTitle = mAccountScreenTitle;
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