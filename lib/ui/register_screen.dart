import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  MyRegist createState() {
    return MyRegist();
  }
}

class MyRegist extends State<RegisterScreen> {
  bool check = false;
  List<TextEditingController> textControl = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController()
  ];
  MyRegist();
  MyRegist.nameConst(Account account) {
    ListAccount.users.add(account);
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              child: Text("REGISTER"),
              margin: EdgeInsets.fromLTRB(60, 20, 0, 50)),
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "jonde@mail.com",
                      icon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: textControl[0],
                    onSaved: (value) => print(value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "กรุณาระบุ user";
                      } else if (value
                              .compareTo(ListAccount.getAccount(0).name) ==
                          0) {
                        check = true;
                      }
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "•••••••",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    controller: textControl[1],
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "•••••••",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    controller: textControl[2],
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
                    child:
                        Text("CONTINUE", style: TextStyle(color: Colors.white)),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                        ));
                      } else if (check) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("user นี้มีอยู่ในระบบแล้ว"),
                        ));
                      } else {
                        Navigator.pop(context);
                      }
                      check = false;
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                )
              ],
            ),
          );
        }));
  }
}

class Account {
  String name, password;
  Account();
  Account.named(String name, password) {
    this.name = name;
    this.password = password;
  }
}

class ListAccount {
  static List<Account> users = [Account.named("admin", "admin")];
  static void addAccount(Account account) {
    ListAccount.users.add(account);
  }

  static Account getAccount(int index) {
    return users[index];
  }
}
