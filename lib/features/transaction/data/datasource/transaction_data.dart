
import 'package:piggy/features/transaction/data/models/group_transaction_model.dart';
import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class TransactionRepository {

  static final List<GroupTransactionModel> transaction = [
    GroupTransactionModel(DateTime.utc(2023, 12, 01), transOnFirst),
    GroupTransactionModel(DateTime.utc(2023, 12, 02), transOnSecond),
    GroupTransactionModel(DateTime.utc(2023, 12, 03), transOnThird),
    GroupTransactionModel(DateTime.utc(2023, 12, 04), transOnFourth),
    GroupTransactionModel(DateTime.utc(2023, 12, 05), transOnFifth),
    GroupTransactionModel(DateTime.utc(2023, 12, 06), transOnSixth),
    GroupTransactionModel(DateTime.utc(2023, 12, 07), transOnSeventh),
    GroupTransactionModel(DateTime.utc(2023, 12, 08), transOnEigth),
    GroupTransactionModel(DateTime.utc(2023, 12, 09), transOnNinth),
    GroupTransactionModel(DateTime.utc(2023, 12, 10), transOnTenth),
    GroupTransactionModel(DateTime.utc(2023, 12, 11), transOnEleventh),
    GroupTransactionModel(DateTime.utc(2023, 12, 12), transOnTwelvth),
  ];

  static final List<TransactionItemModel> transOnFirst = [
    TransactionItemModel('Cookie', DateTime.utc(2023, 12, 01)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 01)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 01)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 01)),
  ];

  static final List<TransactionItemModel> transOnSecond = [
    TransactionItemModel('Croissant', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 02)),
    TransactionItemModel('Egg roll', DateTime.utc(2023, 12, 02)),
  ];

  static final List<TransactionItemModel> transOnThird = [
    TransactionItemModel('Cabbage roll', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Cheese', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 03)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 03)),
  ];

  static final List<TransactionItemModel> transOnFourth = [
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 04)),
    TransactionItemModel('Cheese', DateTime.utc(2023, 12, 04)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 04)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 04)),
  ];

  static final List<TransactionItemModel> transOnFifth = [
    TransactionItemModel('Cheese', DateTime.utc(2023, 12, 05)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 05)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 05)),
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 05)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 05)),
  ];

  static final List<TransactionItemModel> transOnSixth = [
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 06)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 06)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 06)),
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 06)),
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 06)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 06)),
  ];

  static final List<TransactionItemModel> transOnSeventh = [
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Bacon', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Cookie', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Steak', DateTime.utc(2023, 12, 07)),
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 07)),
  ];

  static final List<TransactionItemModel> transOnEigth = [
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 08)),
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 08)),
    TransactionItemModel('Egg roll', DateTime.utc(2023, 12, 08)),
  ];

  static final List<TransactionItemModel> transOnNinth = [
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 09)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 09)),
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 09)),
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 09)),
    TransactionItemModel('Cheese', DateTime.utc(2023, 12, 09)),
  ];

  static final List<TransactionItemModel> transOnTenth = [
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 10)),
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 10)),
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 10)),
    TransactionItemModel('Cheese', DateTime.utc(2023, 12, 10)),
  ];

  static final List<TransactionItemModel> transOnEleventh = [
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 11)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 11)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 11)),
    TransactionItemModel('Pancake', DateTime.utc(2023, 12, 11)),
  ];

  static final List<TransactionItemModel> transOnTwelvth = [
    TransactionItemModel('Egg roll', DateTime.utc(2023, 12, 12)),
    TransactionItemModel('Spaghetti', DateTime.utc(2023, 12, 12)),
    TransactionItemModel('Ham', DateTime.utc(2023, 12, 12)),
    TransactionItemModel('Pudding', DateTime.utc(2023, 12, 12)),
    TransactionItemModel('Lasagna', DateTime.utc(2023, 12, 12)),
  ];

}