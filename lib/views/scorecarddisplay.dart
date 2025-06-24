import 'package:flutter/material.dart';
import 'package:cs442_mp3/models/scorecard.dart';

class ScoreCardDisplay extends StatelessWidget {
  final ScoreCard scoreCard;
  final Function(ScoreCategory) onScoreButtonPressed;
  final int currentScore;
  final Function() onResetGamePressed;

  const ScoreCardDisplay({
    Key? key,
    required this.scoreCard,
    required this.onScoreButtonPressed,
    required this.currentScore,
    required this.onResetGamePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Score card',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        for (ScoreCategory category in ScoreCategory.values)
          Column(
            children: [
              _buildScoreCardItem(category, context),
              if (category != ScoreCategory.values.last)
                const Divider(height: 1, color: Colors.black),
            ],
          ),
        const SizedBox(height: 10),
        _buildCurrentScore(),
        ElevatedButton(
          onPressed: onResetGamePressed,
          child: const Text(
            'Reset',
            style: TextStyle(
                color: Color.fromARGB(255, 204, 56, 93),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildScoreCardItem(ScoreCategory category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${category.name}:'),
        Text('${scoreCard[category] ?? '-'}'),
        TextButton(
          onPressed: () => onScoreButtonPressed(category),
          child: const Text(
            'Pick',
            style: TextStyle(color: Color.fromARGB(255, 6, 33, 58)),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentScore() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Current Score: ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            '$currentScore',
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
