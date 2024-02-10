import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/add_transaction/models/category_model.dart';

final List<CategoryModel> expenseCategories = [
  CategoryModel(name: "Food", iconData: Icons.fastfood),
  CategoryModel(name: "Transport", iconData: Icons.directions_car),
  CategoryModel(name: "Utilities", iconData: Icons.lightbulb_outline),
  CategoryModel(name: "Shopping", iconData: Icons.shopping_cart),
  CategoryModel(name: "Entertainment", iconData: Icons.movie),
  CategoryModel(name: "Health", iconData: Icons.favorite),
  CategoryModel(name: "Education", iconData: Icons.school),
  CategoryModel(name: "Travel", iconData: Icons.airplanemode_active),
  CategoryModel(name: "Bills", iconData: Icons.receipt),
  CategoryModel(name: "Gifts", iconData: Icons.card_giftcard),
  CategoryModel(name: "Other", iconData: Icons.category),
  CategoryModel(name: "Savings", iconData: Icons.account_balance),
];

final List<CategoryModel> incomeCategories = [
  CategoryModel(name: "Salary", iconData: Icons.attach_money),
  CategoryModel(name: "Investments", iconData: Icons.trending_up),
  CategoryModel(name: "Freelance", iconData: Icons.work),
  CategoryModel(name: "Gifts", iconData: Icons.card_giftcard),
  CategoryModel(name: "Interest", iconData: Icons.account_balance),
  CategoryModel(name: "Rental Income", iconData: Icons.house),
  CategoryModel(name: "Dividends", iconData: Icons.bar_chart),
  CategoryModel(name: "Bonuses", iconData: Icons.monetization_on),
  CategoryModel(name: "Grants", iconData: Icons.account_balance_wallet),
];