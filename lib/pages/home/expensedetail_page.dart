import 'package:flutter/material.dart';
import 'package:frontend/shared/models/expenses.dart';

class ExpenseDetailPage extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailPage({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expense.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.type),
                Text(expense.title),
                Text("\$${expense.amount}"),
                Text(expense.date),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
