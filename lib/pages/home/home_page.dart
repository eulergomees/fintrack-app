import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/app_images.dart';
import 'package:frontend/pages/home/expensedetail_page.dart';
import 'package:frontend/shared/addexpense_modal.dart';
import 'package:frontend/shared/models/expenses.dart';
import '../../services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();

  List<Expense> sampleExpenses = [
    Expense(
      id: '1',
      type: 'expense',
      amount: "50",
      date: "2025-03-07",
      title: 'Lunch at a restaurant',
    ),
    Expense(
      id: '2',
      type: 'income',
      amount: '500.0',
      date:  "2023-06-01",
      title: 'Monthly salary',
    ),
    Expense(
      id: '3',
      type: 'expense',
      amount: "30",
      date: "2023-06-01",
      title: 'Gas for the car',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FinTrack"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.logo),
                ),
                accountName: Text((widget.user.displayName != null)
                    ? widget.user.displayName!
                    : ""),
                accountEmail: Text(widget.user.email!)),
            ListTile(leading: Icon(Icons.place_outlined),
            title: Text("Placeholder"),),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout"),
              onTap: () {
                _authService.logout();
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: List.generate(
          sampleExpenses.length,
          (index) {
            Expense expenseModel = sampleExpenses[index];
            return ListTile(
              title: Text(expenseModel.title),
              subtitle: Text(expenseModel.type),
              trailing: Text("\$${expenseModel.amount}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseDetailPage(
                      expense: expenseModel,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showAddExpenseModal(context);
      }, child: Icon(Icons.add),),
    );
  }
}
