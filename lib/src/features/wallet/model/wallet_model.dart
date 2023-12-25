import 'package:intl/intl.dart';

class WalletModel {
  final String walletId;
  final String walletName;
  final int walletBalance;

  WalletModel(this.walletId, this.walletName, this.walletBalance);

  String getFormattedWalletBalance() {
    return "${NumberFormat('#,###').format(walletBalance)} THB";
  }
}