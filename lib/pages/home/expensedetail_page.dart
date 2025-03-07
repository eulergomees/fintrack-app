import 'package:flutter/material.dart';
import 'package:frontend/shared/models/expenses.dart';

class ExpenseDetailPage extends StatelessWidget {
  final Expense expense;
  ExpenseDetailPage({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expense.title),
      ),
    );
  }
}
