/*Design the logic of a single-player Dice Game in Flutter (using Dart) as described below. You
need to design a screen with a button and a Text widget. When the button is clicked, a player’s
turn generates a random number from 1 to 6 [hint: int number = Random().nextInt(6) + 1;].
There is a total of 5 turns. The player’s winning combinations is a list of 3 numbers: [2, 4, 6]. We
need to log each turn of the player into a list containing his past dice numbers. If the person
gets a 6 in three consecutive turns, he is declared winner and the game ends. If the person’s at
least 3 dice numbers in the past dice numbers list match with his winning combinations, he
wins and the game ends. If none of the above two happens till 5 rounds limit, then the person is
considered winner if the total sum of his dice numbers is greater than 15. If none of the winning
condition occurs, the person loses. Write backend logic of onPressed function calling a function
with prototype: void makeTurn(). Also write other logic/functions of StatefulWidget. Print
messages in console like “Player 1 wins” or “Player 1 loses” using print function. */

import 'dart:math'; 
import 'package:flutter/material.dart'; 
void main() { 
  runApp(MaterialApp(home: DiceGame())); 
} 
 
class DiceGame extends StatefulWidget { 
  const DiceGame({super.key}); 
 
  @override 
  State<DiceGame> createState() => _DiceGameState(); 
 
} 
 
class _DiceGameState extends State<DiceGame> { 
  int playerTurns = 0; 
  int currentTurn = 0; 
  List<int> winningCombinations = [2, 4, 6]; 
  List<int> diceNumbers = []; 
  int threeSixesCount = 0; 
  int totalSum = 0; 
  bool gameOver = false; 
 
  void makeTurn() { 
    setState(() { 
      currentTurn = Random().nextInt(6) + 1; 
      playerTurns = playerTurns + 1; 
      diceNumbers.add(currentTurn); 
      totalSum += currentTurn; 
 
      print(currentTurn); 
 
      if (currentTurn == 6) { 
        threeSixesCount += 1; 
      } else { 
        threeSixesCount = 0; 
      } 
 
      if (threeSixesCount == 3) { 
        gameOver = true; 
        print("Game Over - Player 1 wins: Rolled three sixes!"); 
      } 
 
      if (playerTurns >= 3) { 
        if (winningCombinations.every((cell) => diceNumbers.contains(cell))) { 
          gameOver = true; 
          print("Game Over - Player 1 wins: Winning combination rolled!"); 
        } 
      } 
 
      if (playerTurns >= 5) { 
        if (totalSum >= 15) { 
          gameOver = true; 
          print("Game Over - Player 1 wins: Total sum is $totalSum"); 
        } 
      } 
    }); 
  } 
 
  @override 

 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            Text("Throw dice"), 
            ElevatedButton( 
              onPressed: gameOver == false ? makeTurn : () {}, 
              child: Text("Click Here"), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 

