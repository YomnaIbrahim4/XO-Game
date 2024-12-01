import 'package:flutter/material.dart';

import 'boardscreen.dart';

class LogInSCreen extends StatelessWidget{
  static const String routeName = "Log In";
 // String player1name = "";
  //String player2name = "";
  TextEditingController player1controller = TextEditingController();
  TextEditingController player2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       backgroundColor: Colors.brown,
       title: Text(
         "Log In Route X-O",
         style: TextStyle(
           color: Colors.white,
         ),
       ),
     ),
     body: Container(
       margin: EdgeInsets.symmetric(
         horizontal: 0.07 * width,
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextField(
             controller: player1controller,
            /* onChanged: (value){
               player1name = value;
             },*/
             decoration: InputDecoration(
               hintText: "Player 1 Name ",
             ),
           ),
           SizedBox(height: 0.05 * height,),
           TextField(
             controller: player2controller,
             /*onChanged: (value){
               player2name = value;
             },*/
             decoration: InputDecoration(
                 labelText: "Player 2 Name ",
             ),
           ),
           SizedBox(height: 0.05 * height,),
           ElevatedButton(
               onPressed: (){
                 Navigator.pushNamed(context, BoardScreen.routeName,
                 arguments: BoardScreenArgs(
                     player1: player1controller.text,
                     player2: player2controller.text,
                 ));
               },
               child: Text("Play"),
           )
         ],
       ),
     ),

   );
  }


}