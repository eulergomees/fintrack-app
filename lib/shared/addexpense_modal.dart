import 'package:flutter/material.dart';
import 'package:frontend/core/app_textstyle.dart';
import 'package:frontend/core/app_theme.dart';
import 'package:frontend/services/expense_service.dart';
import 'package:uuid/uuid.dart';

import 'models/expenses.dart';

showAddExpenseModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.bone,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return ExpenseModal();
      },
      isScrollControlled: true);
}

class ExpenseModal extends StatefulWidget {
  ExpenseModal({super.key});

  @override
  State<ExpenseModal> createState() => _ExpenseModalState();
}

class _ExpenseModalState extends State<ExpenseModal> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  bool isLoaded = false;

  ExpenseService _expenseService = ExpenseService();

  sendExpense() {
    String title = _titleController.text;
    String type = _typeController.text;
    String amount = _amountController.text;
    String date = _dateController.text;

    Expense expense = Expense(
        id: Uuid().v1(),
        type: type,
        amount: amount,
        date: date,
        title: title);

    _expenseService.addExpense(expense).then((value) {
      setState(() {
        isLoaded = false;
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.6,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Add New Expense/Income",
                        style: AppTextStyle.boldTextCarbon),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppTheme.carbon,
                        ))
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _typeController,
                      decoration: InputDecoration(
                        labelText: "Type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: "Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  sendExpense();
                },
                child: (isLoaded)
                    ? Container(
                    height: 16,
                    width: 16,
                    child: const CircularProgressIndicator(
                      color: AppTheme.ocean,
                    ))
                    : const Text(
                  "Add Expense",
                  style: AppTextStyle.boldTextCarbon,
                ))
          ],
        ),
      ),
    );
  }
}
