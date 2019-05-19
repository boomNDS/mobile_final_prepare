import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  Myform createState() {
    return Myform();
  }
}

class Myform extends State<LoginScreen> {
  List<bool> checkAdmin = [false, false];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/cat.jpg",
                height: 200,
              ),
              margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "User Id",
                  hintText: "User Id",
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุ user";
                  } else if (value.compareTo(ListAccount.getAccount(0).name) ==
                      0) {
                    checkAdmin[0] = true;
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: TextFormField(
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
                  } else if (value
                          .compareTo(ListAccount.getAccount(0).password) ==
                      0) {
                    checkAdmin[1] = true;
                  }
                },
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            Container(
              child: RaisedButton(
                child: Text("LOGIN"),
                onPressed: () {
                  print(_formKey.currentState.validate());
                  if (!_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("กรุณาระบุ user or password"),
                    ));
                  } else if ((checkAdmin[0] == true &&
                      checkAdmin[1] == false)) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("user or password ไม่ถูกต้อง"),
                    ));
                  } else if ((checkAdmin[0] == false &&
                      checkAdmin[1] == true)) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("user or password ไม่ถูกต้อง"),
                    ));
                  }
                  else if ((checkAdmin[0] == false &&
                      checkAdmin[1] == false)) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("user or password ไม่ถูกต้อง"),
                    ));
                      } 
                  else {
                    Navigator.pushNamed(context, "/Main");
                  }
                  checkAdmin[0] = false;
                  checkAdmin[1] = false;
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
