import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatted = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.headphones,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formateddate {
    return formatted.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});
  ExpenseBucket.forCategory(List<Expense> allexpense, this.category)
      : expenses = allexpense
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;
  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
