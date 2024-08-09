import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/expense-list/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/exp.dart';
import 'package:expense_tracker/expense-list/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter',
        amount: 20,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'film',
        amount: 29,
        date: DateTime.now(),
        category: Category.leisure)
  ];
  void _addButton() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final indexRemoved = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Deleted Expense'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(indexRemoved, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _addButton, icon: const Icon(Icons.add))
        ],
      ),
      body: width <= 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: ExpenseList(
                    expenses: _registeredExpenses,
                    removeExp: _removeExpense,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: ExpenseList(
                    expenses: _registeredExpenses,
                    removeExp: _removeExpense,
                  ),
                ),
              ],
            ),
    );
  }
}
