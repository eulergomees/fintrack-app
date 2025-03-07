import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../shared/models/expenses.dart';

class ExpenseService {
  String userId;

  ExpenseService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(Expense expense) async {
    return await _firestore.collection(userId).doc(expense.id).set(expense.toMap());
  }
}
