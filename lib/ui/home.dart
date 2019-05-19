import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  MyMain createState() {
    return new MyMain();
  }
}

class MyMain extends State {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
                title: Center(child: Text("Home")),
                automaticallyImplyLeading: false),
            body: TabBarView(
              children: [
                new Container(
                  child: Center(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        inherit: true,
                        fontSize: 38.0,
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                new Container(
                  child: Center(
                    child: Text('Notify',
                        style: TextStyle(
                          inherit: true,
                          fontSize: 38.0,
                        )),
                  ),
                  color: Colors.white,
                ),
                new Container(
                  child: Center(
                    child: Text('Map',
                        style: TextStyle(
                          inherit: true,
                          fontSize: 38.0,
                        )),
                  ),
                  color: Colors.white,
                ),
                new Container(
                  child: Center(
                    child: Text('Profile',
                        style: TextStyle(
                          inherit: true,
                          fontSize: 38.0,
                        )),
                  ),
                  color: Colors.white,
                ),
                new Container(
                  child: Center(
                    child: Text('Setup',
                        style: TextStyle(
                          inherit: true,
                          fontSize: 38.0,
                        )),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
            bottomNavigationBar: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: new Material(
                  child: TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.view_compact),
                      ),
                      Tab(
                        icon: Icon(Icons.notifications),
                      ),
                      Tab(
                        icon: Icon(Icons.explore),
                      ),
                      Tab(
                        icon: Icon(Icons.person),
                      ),
                      Tab(
                        icon: Icon(Icons.settings),
                      )
                    ],
                  ),
                  color: Colors.blue,
                ))));
  }
}
