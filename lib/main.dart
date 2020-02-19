import 'package:controle_combustivel/views/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ControleCombustivelApp());

class ControleCombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[800],
          textTheme: ButtonTextTheme.primary
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[800],
        )
      ),
      home: HomePage(),
    );
  }
}
