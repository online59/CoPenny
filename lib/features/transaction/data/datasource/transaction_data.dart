import 'dart:math';

import '../../domain/models/transaction_header_model.dart';
import '../../domain/models/transaction_item_model.dart';

class TransDataSource {
  Future<List<TransHeaderModel>> generateDummyTransaction(String walletId) async {
    Future.delayed(const Duration(seconds: 1));
    return List.generate(30, (index) {
      var date = DateTime.utc(2023, 12, 01 + index);
      return TransHeaderModel(
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
