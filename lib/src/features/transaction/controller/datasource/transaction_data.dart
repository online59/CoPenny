import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:piggy/src/features/transaction/model/transaction_group_model.dart';
import 'package:piggy/src/features/transaction/model/transaction_item_model.dart';

class TransDataSource {

  late Stream itemCollection;

  TransDataSource(){
    itemCollection = FirebaseFirestore.instance.collection(getPath()).snapshots();
  }

  String getPath() {
    User? firebaseAuth = FirebaseAuth.instance.currentUser;

    return "transactions/${firebaseAuth!.uid}/202312/50/16";
  }

  List<TransGroupModel> generateDummyTransaction(String walletId) {
    Future.delayed(const Duration(seconds: 1));
    return List.generate(30, (index) {
      var date = DateTime.utc(2023, 12, 01 + index);
      return TransGroupModel(
        date,
        _generateTransItem(date),
      );
    }).toList();
  }

  List<TransItemModel> _generateTransItem(DateTime date) {
    Random random = Random();

    fruits.shuffle();

    return List.generate(
      7,
      (index) => TransItemModel(
        content: fruits[index],
        amount: random.nextInt(2000).toDouble(),
        date: date,
      ),
    );
  }

  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Grape',
    'Mango',
    'Strawberry',
    'Pineapple',
    'Watermelon',
    'Kiwi',
    'Peach',
    'Plum',
    'Pear',
    'Cherry',
    'Raspberry',
    'Blueberry',
    'Blackberry',
    'Avocado',
    'Lemon',
    'Lime',
    'Grapefruit',
    'Papaya',
    'Pomegranate',
    'Coconut',
    'Fig',
    'Apricot',
    'Cantaloupe',
    'Cranberry',
    'Passion fruit',
    'Guava',
    'Nectarine'
  ];
}
