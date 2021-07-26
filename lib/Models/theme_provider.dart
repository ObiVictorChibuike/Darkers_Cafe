import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
      primarySwatch: Colors.red,
  accentColor: Colors.red,
  scaffoldBackgroundColor: Colors.white,

);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.blueGrey[700],
  scaffoldBackgroundColor: Colors.black54,

);

class ThemeNotifier extends ChangeNotifier{
  final String Key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

//initializing shared preferences
  _initPrefs() async{
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
  }

  //reading from the shared_preferences
  _loadSharedPrefs() async{
    await _initPrefs();
    _darkTheme = _prefs.getBool(Key) ?? true;
    notifyListeners();
  }

  //writing into the shared_preferences
  _savedToSharedPrefs() async {
    await _initPrefs();
    _prefs.setBool(Key,_darkTheme);
  }

  ThemeNotifier(){
    _darkTheme = true;
    _loadSharedPrefs();
  }

  toggleTheme(){
    _darkTheme = !darkTheme;
    _savedToSharedPrefs();
    notifyListeners();
  }




}