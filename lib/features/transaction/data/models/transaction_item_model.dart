class TransItemModel {
  final String content;
  final String? subtitle;
  final int amount;
  final DateTime date;

  TransItemModel({
    required this.content,
    required this.amount,
    required this.date,
    this.subtitle,
  });
}
