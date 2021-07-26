import 'package:amat_foodies/SliderScreen.dart';
import 'package:amat_foodies/Screens/MainDashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SharedPreferences prefs;
  bool _userdata;

  Future<bool> checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    _userdata = (prefs.getBool('isLoggedIn') ?? false);
    if (_userdata==true) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainDashBoard()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SliderScreen()));
    }
  }



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      checkLogin();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash.jpg'),
                  fit: BoxFit.cover,
                )
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}

