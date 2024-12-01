import 'package:flutter/material.dart';

typedef onButtonClick = void Function(int);
class BoardButton extends StatelessWidget{
  String symbol;
  onButtonClick buttonClick;
  int position;
  Color color;

  BoardButton({required this.symbol, required this.buttonClick, required this.position , required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
            ),
              onPressed: (){
              buttonClick(position); // calling

              },
              child: Text(
                  symbol,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
          ),
        )
    );
  }

}