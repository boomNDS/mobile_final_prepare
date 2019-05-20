import 'package:flutter/material.dart';
import 'package:mobile_final/ui/friend.dart';
import 'package:mobile_final/ui/my_friend.dart';
import 'package:mobile_final/ui/profile.dart';
import 'ui/login_screen.dart';
import 'ui/register_screen.dart';
import 'ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(48, 63, 159, 1.0)
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
        "/regist": (context) => RegisterScreen(),
        "/Main": (context) => HomeScreen(),
        "/profile":(context)=> ProfileScreen(),
        "/friend":(context)=>     FriendScreen(),
       "/myfriend":(context)=> MyfriendScreen()
      },
    );
  }
}
