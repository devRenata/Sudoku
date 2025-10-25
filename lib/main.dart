import 'package:flutter/material.dart';
import 'package:sudoku/src/presentation/design_system/app_theme.dart';
import 'package:sudoku/src/presentation/pages/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const InitialPage(),
    );
  }
}

