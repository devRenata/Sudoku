import 'package:flutter/material.dart';
import 'package:sudoku/src/presentation/design_system/app_colors.dart';
import 'package:sudoku/src/presentation/design_system/widgets/initial_button.dart';
import 'package:sudoku/src/presentation/pages/game_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                'Sudoku Game',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                InitialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GamePage()),
                    );
                  },
                  text: 'Novo Jogo',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
