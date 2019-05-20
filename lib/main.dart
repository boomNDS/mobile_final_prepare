import 'package:flutter/material.dart';
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
        "/Main": (context) => MainScreen()
      },
    );
  }
}
