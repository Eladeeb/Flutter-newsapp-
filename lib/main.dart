import 'package:flutter/material.dart';
import 'SCreens/Screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SCreens/Screen2.dart';
import 'Utilities/App_Theme.dart';
void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool("seen");
  seen = false;
  Widget _Screen ;
  if(seen == null || seen == false)
  {
    _Screen = Screen1();
  }
  else if (seen== true)
  {
    _Screen =Screen2();
  }
  runApp(MyApp(_Screen));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Widget _Screen ;

  MyApp(this._Screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Screen,
      theme: AppTheme.appTheme,
    );
  }


}
