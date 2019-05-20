import 'package:flutter/material.dart';
import 'package:mobile_final/model/user_model.dart';
import '../db/db.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                      hintText: "User ID",
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
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
                      hintText: "Name",
                      prefixIcon: Icon(Icons.perm_contact_calendar),
                    ),
                    keyboardType: TextInputType.text,
                    controller: textControl[1],
                    onSaved: (value) => print(value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "กรุณาระบุชื่อ";
                      } else if (value
                              .compareTo(ListAccount.getAccount(0).name) ==
                          0) {
                        check = true;
                      }else{
                        int count =0;
                        for(int i=0;i<value.length;i++){
                          if(value[i] ==" "){
                            count++;
                          }
                        }
                        print(count);
                        if(count >1 || count ==0)
                        return "กรุณาระบุนามสกุลให้ถูกต้อง";
                      }
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
                 Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Age",
                      prefixIcon: Icon(Icons.calendar_view_day),
                    ),
                    controller: textControl[2],
                    onSaved: (value) => print(value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "กรุณาระบุอายุ";

                      }
                      else if((int.parse(value) > 80 || int.parse(value) <10)){
                        
                        return "กรุณาระบุอายุให้ถูกต้อง";
                      }
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "•••••••",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    controller: textControl[3],
                    onSaved: (value) => print(value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "กรุณาระบุ password";
                      }else if(value.length<6){
                        return "ความยาว password ไม่เพียงพอ";
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
                    onPressed: () async{
                      if (!_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                        ));
                      } else if (check) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("user นี้มีอยู่ในระบบแล้ว"),
                        ));
                      } else {
                        User user = new User(userid: textControl[0].text, name: textControl[1].text, age: int.parse(textControl[2].text),
                        password: textControl[3].text
                        );
                        print(user.name);
                        await DBProvider.db.newUser(user);
                       
                        Fluttertoast.showToast(msg:"User "+user.name+ " was saved", toastLength:Toast.LENGTH_SHORT);
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
