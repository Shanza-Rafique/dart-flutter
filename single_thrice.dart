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
