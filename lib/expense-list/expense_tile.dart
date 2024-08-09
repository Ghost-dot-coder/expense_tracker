import 'package:expense_tracker/model/exp.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title.toUpperCase(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "\$${expense.amount.toStringAsFixed(2)}",
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        categoryIcons[expense.category],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(expense.formateddate)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
