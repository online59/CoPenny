import 'dart:math';

import 'package:piggy/features/transaction/data/models/transaction_header_model.dart';
import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class TransRepository {

  List<TransItemModel> items = [];

  TransRepository() {
    _generateTransItem();
  }

  List<TransHeaderModel> transaction() {

    List<TransHeaderModel> list = [];

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 01), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 02), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 03), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 04), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 05), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 06), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 07), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 08), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 09), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 10), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 20), items.sublist(0, 7)));

    items.shuffle();
    list.add(TransHeaderModel(DateTime.utc(2023, 12, 21), items.sublist(0, 7)));

    return list;
  }

  void _generateTransItem() {
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

    Random random = Random();

    for (int i = 0; i < 7; i++) {
      items.add(TransItemModel(
        content: fruits[i],
        amount: random.nextInt(500).toDouble(),
        date: DateTime.utc(2023, 12, 01+i),
      ));
    }
  }
}
