# MP Report

## Team

- Name(s): Naman Rajendra Jangid
- AID(s): A20527772

## Self-Evaluation Checklist

Tick the boxes (i.e., fill them with 'X's) that apply to your submission:

- [X] The app builds without error
- [X] I tested the app in at least one of the following platforms (check all that apply):
  - [ ] iOS simulator / MacOS
  - [ ] Android emulator
  - [X] Google Chrome
- [X] The dice rolling mechanism works correctly
- [X] The scorecard works correctly
- [X] Scores are correctly calculated for all categories
- [X] The game end condition is correctly implemented, and the final score is correctly displayed
- [X] The game state is reset when the user dismisses the final score
- [X] The implementation separates layout from data, involving the use of data model classes separate from custom widgets

## Summary and Reflection

I reused the provided dice.dart and scorecard.dart files without modification to effectively handle dice rolling and score calculations. The game rules were implemented in the ScoreCard class, ensuring proper validation for various score categories such as full house, straights, and Yahtzee. For the user interface, I focused on creating a user-friendly experience using Flutter widgets, which included buttons for rolling dice, selecting score categories, and resetting the game. I utilized a StatefulWidget to manage the game state and ensure the UI updates in response to user actions. Additionally, I incorporated error handling to prevent scoring a category more than once. Finally, I customized the button styling with specific colors, padding, and text formatting to maintain a consistent look and feel throughout the application.

I wish I had explored more resources and documentation on Flutter before starting. Familiarity with certain widgets and state management practices would have made the initial stages smoother. Identifying and fixing bugs in the game logic, particularly around scoring, proved to be a challenge. I had to meticulously track variable states and transitions throughout the implementation process. However, I found it satisfying to implement the game rules and scoring logic, especially seeing how each category interacts with the dice rolls. Overall, the project was a rewarding experience that allowed me to deepen my understanding of both game mechanics and Flutter development.
