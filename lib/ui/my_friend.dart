import 'package:flutter/material.dart';

class MyfriendScreen extends StatelessWidget{
  final int id;
  final String name;
  MyfriendScreen({
    this.id,
    this.name
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: <Widget>[
              Text(id.toString()+ " : "+ name),
              RaisedButton(child: Text("TODOS"),onPressed:(){} ,),
              RaisedButton(child: Text("POST"),onPressed:(){} ,),
              RaisedButton(child: Text("ALBUM"),onPressed:(){} ,),
              RaisedButton(child: Text("BACK"),onPressed:(){
                Navigator.pop(context);
              } ,)


            ],
          ),
        ),
      ),

    );
  }

}