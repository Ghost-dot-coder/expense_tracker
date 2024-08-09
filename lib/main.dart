import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

void main() {
  var kColor = ColorScheme.fromSeed(seedColor: Colors.blueGrey);
  var darkColor = ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: Colors.black);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColor,
        appBarTheme: const AppBarTheme()
            .copyWith(backgroundColor: darkColor.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: darkColor.onPrimaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(color: darkColor.onPrimaryContainer)),
        iconTheme: ThemeData().iconTheme.copyWith(color: darkColor.onPrimary),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkColor.onPrimaryContainer,
            foregroundColor: darkColor.onPrimary,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColor,
        appBarTheme: const AppBarTheme()
            .copyWith(backgroundColor: kColor.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: Colors.lightBlueAccent,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontWeight: FontWeight.bold),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColor.onPrimaryContainer,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
