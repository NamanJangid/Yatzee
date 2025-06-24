import 'package:flutter/material.dart';
import 'package:cs442_mp3/models/dice.dart';
import 'package:cs442_mp3/models/scorecard.dart';
import 'package:cs442_mp3/views/dicedisplay.dart';
import 'package:cs442_mp3/views/scorecarddisplay.dart';

class Yahtzee extends StatefulWidget {
  const Yahtzee({Key? key}) : super(key: key);

  @override
  YahtzeeGameState createState() => YahtzeeGameState();
}

class YahtzeeGameState extends State<Yahtzee> {
  final Dice _dice = Dice(5);
  final ScoreCard _scoreCard = ScoreCard();
  int _rollCount = 0;
  bool _isRollButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yahtzee',
          style: TextStyle(color: Colors.orange, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DiceDisplay(
                dice: _dice,
                onDiceButtonPressed: _diceButtonPressed,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _rollCount < 3 ? _rollDice : null,
                child: Text(
                  'Roll Dice ($_rollCount)',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 204, 56, 93),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ScoreCardDisplay(
                scoreCard: _scoreCard,
                onScoreButtonPressed: _scoreButtonPressed,
                currentScore: _scoreCard.total,
                onResetGamePressed: _resetGame,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }

  void _diceButtonPressed(int index) {
    setState(() {
      _dice.toggleHold(index);
    });
  }

  void _rollDice() {
    setState(() {
      _dice.roll();
      _rollCount++;
      if (_rollCount == 3) {
        _disableRollButton();
      }
    });
  }

  void _disableRollButton() {
    setState(() {
      _isRollButtonEnabled = false;
    });
  }

  void _scoreButtonPressed(ScoreCategory category) {
    setState(() {
      _scoreCard.registerScore(category, _dice.values);
      _dice.clear();
      _rollCount = 0;
      _enableRollButton();

      if (_scoreCard.completed) {
        _showGameOverPopup(context);
      }
    });
  }

  void _enableRollButton() {
    setState(() {
      _isRollButtonEnabled = true;
    });
  }

  void _showGameOverPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Total Score: ${_scoreCard.total}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      _dice.clear();
      _scoreCard.clear();
    });
  }
}
