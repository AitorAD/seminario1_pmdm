import 'package:flutter/material.dart';
import 'package:seminario_1/home_temp.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes APP',
        debugShowCheckedModeBanner: false,
        home: HomePageTemp());
  }
}
