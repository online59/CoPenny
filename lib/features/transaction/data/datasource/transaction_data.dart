
import 'package:piggy/features/transaction/data/models/transaction_header_model.dart';
import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class TransRepository {

  static final List<TransHeaderModel> transaction = [
    TransHeaderModel(DateTime.utc(2023, 12, 01), transOnFirst),
    TransHeaderModel(DateTime.utc(2023, 12, 02), transOnSecond),
    TransHeaderModel(DateTime.utc(2023, 12, 03), transOnThird),
    TransHeaderModel(DateTime.utc(2023, 12, 04), transOnFourth),
    TransHeaderModel(DateTime.utc(2023, 12, 05), transOnFifth),
    TransHeaderModel(DateTime.utc(2023, 12, 06), transOnSixth),
    TransHeaderModel(DateTime.utc(2023, 12, 07), transOnSeventh),
    TransHeaderModel(DateTime.utc(2023, 12, 08), transOnEigth),
    TransHeaderModel(DateTime.utc(2023, 12, 09), transOnNinth),
    TransHeaderModel(DateTime.utc(2023, 12, 10), transOnTenth),
    TransHeaderModel(DateTime.utc(2023, 12, 11), transOnEleventh),
    TransHeaderModel(DateTime.utc(2023, 12, 12), transOnTwelvth),
  ];

  static final List<TransItemModel> transOnFirst = [
    TransItemModel('Cookie', 40, DateTime.utc(2023, 12, 01)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 01)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 01)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 01)),
  ];

  static final List<TransItemModel> transOnSecond = [
    TransItemModel('Croissant', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 02)),
    TransItemModel('Egg roll', 40, DateTime.utc(2023, 12, 02)),
  ];

  static final List<TransItemModel> transOnThird = [
    TransItemModel('Cabbage roll', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Cheese', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 03)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 03)),
  ];

  static final List<TransItemModel> transOnFourth = [
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 04)),
    TransItemModel('Cheese', 40, DateTime.utc(2023, 12, 04)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 04)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 04)),
  ];

  static final List<TransItemModel> transOnFifth = [
    TransItemModel('Cheese', 40, DateTime.utc(2023, 12, 05)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 05)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 05)),
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 05)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 05)),
  ];

  static final List<TransItemModel> transOnSixth = [
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 06)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 06)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 06)),
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 06)),
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 06)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 06)),
  ];

  static final List<TransItemModel> transOnSeventh = [
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Bacon', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Cookie', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Steak', 40, DateTime.utc(2023, 12, 07)),
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 07)),
  ];

  static final List<TransItemModel> transOnEigth = [
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 08)),
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 08)),
    TransItemModel('Egg roll', 40, DateTime.utc(2023, 12, 08)),
  ];

  static final List<TransItemModel> transOnNinth = [
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 09)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 09)),
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 09)),
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 09)),
    TransItemModel('Cheese', 40, DateTime.utc(2023, 12, 09)),
  ];

  static final List<TransItemModel> transOnTenth = [
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 10)),
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 10)),
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 10)),
    TransItemModel('Cheese', 40, DateTime.utc(2023, 12, 10)),
  ];

  static final List<TransItemModel> transOnEleventh = [
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 11)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 11)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 11)),
    TransItemModel('Pancake', 40, DateTime.utc(2023, 12, 11)),
  ];

  static final List<TransItemModel> transOnTwelvth = [
    TransItemModel('Egg roll', 40, DateTime.utc(2023, 12, 12)),
    TransItemModel('Spaghetti', 40, DateTime.utc(2023, 12, 12)),
    TransItemModel('Ham', 40, DateTime.utc(2023, 12, 12)),
    TransItemModel('Pudding', 40, DateTime.utc(2023, 12, 12)),
    TransItemModel('Lasagna', 40, DateTime.utc(2023, 12, 12)),
  ];

}