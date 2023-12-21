import 'package:intl/intl.dart';
import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class TransHeaderModel {
  final DateTime header;
  final List<TransItemModel> items;

  TransHeaderModel(this.header, this.items);

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
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  String calculateTotalAmount() {
    return "${items.fold(0.0, (double sum, TransItemModel item) => sum + item.amount).toInt()} THB";
  }

}
