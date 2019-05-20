import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_final/db/db.dart';
import 'package:mobile_final/model/shared_preference.dart';
import 'package:mobile_final/model/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  Myform createState() {
    return Myform();
  }
}

class Myform extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  List<TextEditingController> textControl = [
    new TextEditingController(),
    new TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Login")
      ),
      body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.network(
                "https://news.nationalgeographic.com/content/dam/news/2018/05/17/you-can-train-your-cat/02-cat-training-NationalGeographic_1484324.ngsversion.1526587209178.adapt.1900.1.jpg",
                height: 200,
              ),
              margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
            ),
            Container(
              child: TextFormField(
                controller: textControl[0],
                decoration: InputDecoration(
                  labelText: "User Id",
                  hintText: "User Id",
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุ user";
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: TextFormField(
                controller: textControl[1],
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "password",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุ password";
                  } 
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: RaisedButton(
                child: Text("LOGIN"),
                onPressed: () async{
                  print(_formKey.currentState.validate());
                  if (!_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("กรุณาระบุ user or password"),
                    ));
                  }
                  else {
                    List<User> users = await DBProvider.db.getAllUser();
                    bool check = false;
                    for(int i=0;i<users.length;i++){
                      print("userid "+users[i].userid +" == "+textControl[0].text);
                      print("pass "+users[i].password+" == "+textControl[1].text);
                      
                      if(users[i].userid == textControl[0].text && users[i].password == textControl[1].text){
                        check =true;
                        SharePreference.setAttr(users[i]);
                        Navigator.pushNamed(context, "/Main");

                      }
                    }
                    if(!check) {
                      Fluttertoast.showToast(msg:"Invalid user or password", toastLength:Toast.LENGTH_SHORT);}
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: GestureDetector(
                    child: Text("Register New Account",
                        style: TextStyle(color: Colors.green),
                        textDirection: TextDirection.ltr),
                    onTap: () {
                      Navigator.pushNamed(context, "/regist");
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                ))
          ],
        ),
      );
    }));
  }
}
