class Expense {
  final String id;
  final String type;
  final String amount;
  final String date;
  final String title;

  Expense({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.title,
  });

  Expense.fromMap(Map<String, dynamic> map) :
      id = map['id'],
      type = map['type'],
      amount = map['amount'],
      date = map['date'],
      title = map['title'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'amount': amount,
      'date': date,
      'notes': title,
    };
  }
}
