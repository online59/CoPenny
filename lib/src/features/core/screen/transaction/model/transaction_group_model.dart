import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'transaction_item_model.dart';

class TransGroupModel {
  final DateTime header;
  final List<TransItemModel> items;

  TransGroupModel(this.header, this.items);

  TransGroupModel.fromJson(Map<String, Object?> json)
      : this(DateTime.parse(json['transDate']! as String),
            json['transItem']! as List<TransItemModel>);

  Map<String, Object?> toJson() {
    return {
      'transDate': header,
      'transItems': items,
    };
  }

  String getFormattedHeader() {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (isSameDay(header, now)) {
      return 'Today';
    } else if (isSameDay(header, yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM dd, yyyy').format(header);
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  int calculateTotalAmount() {
    return items
        .fold(0.0, (double sum, TransItemModel item) => sum + item.amount)
        .toInt();
  }

  String getFormattedTotalAmount() {
    return "${NumberFormat('#,###').format(calculateTotalAmount())} THB";
  }

  List<TransItemModel> getSortedListItems() {
    items.sort((a, b) => a.date.compareTo(b.date));
    return items;
  }
}
