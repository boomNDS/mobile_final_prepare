import 'package:flutter/material.dart';
import 'package:mobile_final/model/friend_model.dart';
import 'package:mobile_final/service/friend_service.dart';
import 'package:mobile_final/ui/my_friend.dart';

class FriendScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RaisedButton(
          child: Text("Back"),
          onPressed:(){ 
          Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Friend>>(
        future: getAllFriend(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Text("Error");
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  Friend friend = snapshot.data[index];
                  return Card(
                  child: Container(
                    child: RaisedButton(
                                          child: Column(
                        children: <Widget>[
                          Text(friend.id.toString()+" : "+ friend.name),
                          Text(friend.email),
                          Text(friend.phone),
                          Text(friend.website)
                        ],
                      ), onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyfriendScreen(
                                  id: friend.id,name: friend.name,
                                  )),
                        );
                        
                      },
                    ),
                  ),
                    );
                },
              );
            }
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    
    );
  }

}