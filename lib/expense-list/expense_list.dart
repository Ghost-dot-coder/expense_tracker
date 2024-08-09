import 'package:expense_tracker/model/exp.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense-list/expense_tile.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.removeExp});
  final List<Expense> expenses;
  final void Function(Expense expense) removeExp;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "DELETE",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExp(expenses[index]);
        },
        child: ExpenseTile(
          expense: expenses[index],
        ),
      ),
    );
  }
}
