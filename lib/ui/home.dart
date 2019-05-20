import 'package:flutter/material.dart';
import 'package:mobile_final/model/shared_preference.dart';
import 'package:mobile_final/read_write_file/file.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<HomeScreen> {
  String quote = "to day is my day";
  @override
  void initState() {
    super.initState();
    getText();
  }

  void getText() async {
    quote = await FileManager.fileManager.readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                    "Hello " + SharePreference.name == null
                        ? "FIRSTNAME LASTNAME"
                        : SharePreference.name,
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 0.5)),
              ),
              Text("this is my quote " + '\"$quote\"'),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
                child: Text("Profile Setup"),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/friend");
                  },
                  child: Text("My Friend")),
              RaisedButton(
                  onPressed: () {
                    SharePreference.clear();
                    Navigator.pop(context);
                  },
                  child: Text("Sign Out"))
            ],
          ),
        ),
      ),
    );
  }
}
