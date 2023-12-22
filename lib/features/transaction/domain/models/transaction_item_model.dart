import 'package:intl/intl.dart';

class TransItemModel {
  final String content;
  final String? subtitle;
  final double amount;
  final DateTime date;

  TransItemModel({
    required this.content,
    required this.amount,
    required this.date,
    this.subtitle,
  });

  String getFormattedAmount() {
    return "${NumberFormat('#,###').format(amount)} THB";
  }
}
