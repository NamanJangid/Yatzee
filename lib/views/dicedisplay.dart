import 'package:flutter/material.dart';
import 'package:cs442_mp3/models/dice.dart';

class DiceDisplay extends StatelessWidget {
  final Dice dice;
  final Function(int) onDiceButtonPressed;

  const DiceDisplay({
    Key? key,
    required this.dice,
    required this.onDiceButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < dice.values.length; i++)
          _buildDiceButton(i, context),
      ],
    );
  }

  Widget _buildDiceButton(int index, BuildContext context) {
    return OutlinedButton(
      onPressed: () => onDiceButtonPressed(index),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            dice.isHeld(index) ? const Color.fromARGB(255, 8, 131, 187) : null,
      ),
      child: Text('${dice[index] ?? 'Roll'}'),
    );
  }
}
