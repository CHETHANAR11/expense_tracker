import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter =
    DateFormat.yMd(); //creates a formated object whtch is used to formate date
const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work
} //keyword that allows us to create custom type

const categoryIcon = {
  Category.food: Icons.lunch_dining_outlined,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
            .v4(); //initialiser (:)///geenrate unique id //v4 method generate id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter
        .format(date); //returns a string containg formated ver of date
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category) //to filter
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList(); //alternative constructive function

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
