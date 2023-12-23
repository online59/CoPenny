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

  TransItemModel.fromJson(Map<String, Object?> json)
      : this(
          content: json['transTitle']! as String,
          amount: json['transAmount']! as double,
          date: DateTime.parse(json['transDate']! as String),
          subtitle: (json['transSubtitle'] ??= '') as String,
        );

  Map<String, Object?> toJson() {
    return {
      'transTitle': content,
      'transAmount': amount,
      'transDate': date,
      'transSubtitle': subtitle,
    };
  }

  String getFormattedAmount() {
    return "${NumberFormat('#,###').format(amount)} THB";
  }
}
