import 'package:flutter/material.dart';
import 'package:xo_game/boardbutton.dart';

class BoardScreen extends StatefulWidget{
  static const String routeName = "Board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = [
    "" , "" , "" ,
    "" , "" , "" ,
    "" , "" , ""
  ];
  int player1score = 0;
  int player2score = 0;

  @override
  Widget build(BuildContext context) {
    BoardScreenArgs args = ModalRoute.of(context)!.settings.arguments as BoardScreenArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text(
          "Route X_O",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${args.player1} (X)",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                        "Score : $player1score",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${args.player2} (O)",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                        "Score : $player2score",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(symbol: boardState[0], buttonClick: Play, position: 0,color: Colors.cyanAccent,),
                BoardButton(symbol: boardState[1],buttonClick: Play, position: 1,color: Colors.orangeAccent,),
                BoardButton(symbol: boardState[2],buttonClick: Play, position: 2,color: Colors.grey,),
               ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(symbol: boardState[3],buttonClick: Play, position: 3,color: Colors.purple,),
                BoardButton(symbol: boardState[4],buttonClick: Play, position: 4,color: Colors.limeAccent,),
                BoardButton(symbol: boardState[5],buttonClick: Play, position: 5,color: Colors.indigoAccent,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(symbol: boardState[6],buttonClick: Play, position: 6,color: Colors.red,),
                BoardButton(symbol: boardState[7],buttonClick: Play, position: 7,color: Colors.green,),
                BoardButton(symbol: boardState[8],buttonClick: Play, position: 8,color: Colors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 1; // rounds number


  Play(int position){
    print("Button Clicked $position");
    if(boardState[position].isEmpty){
      setState(() {
        if (counter.isOdd) {
          boardState[position] = "X";
        }
        else{
          boardState[position] = "O";
        }
        if (checkWinner("X")){
          player1score+=10; // inside setState
          resetGame(); // calling it in setState function
        }
        else if (checkWinner("O")){
          player2score+=10; // inside setState
          resetGame(); // calling it in setState function
        }
        else if (counter == 9){ // تعادل
          resetGame();
        }
        else{
          counter++;
        }
      }
      );
    }

  }

  bool checkWinner(String symbol){
    for (int i = 0 ; i < 9 ; i+=3){
      if (boardState[i] == symbol && boardState[i+1] == symbol && boardState[i+2] == symbol){
        return true;
      }
    }

    for (int i = 0 ; i < 3 ; i++){
      if (boardState[i] == symbol && boardState[i+3] == symbol && boardState[i+6] == symbol){
        return true;
      }
    }

    if (boardState[0] == symbol && boardState[4] == symbol && boardState[8] == symbol){
      return true;
    }

    if (boardState[2] == symbol && boardState[4] == symbol && boardState[6] == symbol){
      return true;
    }

    return false;
  }

  resetGame(){ // maka all buttons empty // will call it in setState function
      boardState =  [
        "" , "" , "" ,
        "" , "" , "" ,
        "" , "" , ""
      ];
    counter = 1 ;

  } // will call it in setState function


}

class BoardScreenArgs{ // data class
  String player1;
  String player2;
  BoardScreenArgs({required this.player1 , required this.player2});
}