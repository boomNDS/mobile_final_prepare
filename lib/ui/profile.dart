import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_final/db/db.dart';
import 'package:mobile_final/model/shared_preference.dart';
import 'package:mobile_final/model/user_model.dart';
import 'package:mobile_final/read_write_file/file.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }

}

class _ProfileState extends State<ProfileScreen>{
  final _formKey = GlobalKey<FormState>();
    List<TextEditingController> textControl = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController()
  ];
  TextEditingController quote = new TextEditingController();
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
                ),Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Quote",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    controller: quote,
                    onSaved: (value) => print(value),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "กรุณาใส่ quote";
                      }
                    },
                  ),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
                Container(
                  child: RaisedButton(
                    child:
                        Text("Save", style: TextStyle(color: Colors.white)),
                    color: Theme.of(context).accentColor,
                    onPressed: () async{
                      if (!_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                        ));
                      }  else {
                        User user = new User(id: SharePreference.id,userid: textControl[0].text, name: textControl[1].text, age: int.parse(textControl[2].text),
                        password: textControl[3].text
                        );
                        print(user.name);
                        await DBProvider.db.updateUser(user);
                        FileManager.fileManager.writeFile(quote.text);
                        SharePreference.setAttr(user);
                        Fluttertoast.showToast(msg:"User "+user.name+ " was update", toastLength:Toast.LENGTH_SHORT);
                        Navigator.pop(context);
                      }
                    
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