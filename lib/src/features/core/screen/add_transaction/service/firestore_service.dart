import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/features/core/screen/transaction/model/transaction_group_model.dart';
import 'package:piggy/src/features/core/screen/transaction/model/transaction_item_model.dart';

class FirestoreService {

  String getPath(TransGroupModel data) {
    User? firebaseAuth = FirebaseAuth.instance.currentUser;

    return "transactions/${firebaseAuth!.uid}/${data.header.year}${data.header.month}/${weekNumber(data.header)}/${data.header.day}";
  }

  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  Future<void> writeDataToFirestore(String path, TransGroupModel data) async {
    var storeRef = FirebaseFirestore.instance
        .collection(path)
        .withConverter<TransItemModel>(
      fromFirestore: (snapshot, _) =>
          TransItemModel.fromJson(snapshot.data()!),
      toFirestore: (transaction, _) => transaction.toJson(),
    );

    await storeRef
        .add(TransItemModel(
      content: data.items[0].content,
      amount: data.items[0].amount,
      date: data.items[0].date,
      subtitle: data.items[0].subtitle,
    ))
        .then((value) => debugPrint('value added'))
        .catchError((error) => debugPrint(error.toString()));
  }
}
