import 'package:flutter/material.dart';
import 'package:seminario_1/card_page.dart';
import 'package:seminario_1/home_temp.dart';
import 'package:seminario_1/alert_page.dart';
import 'package:seminario_1/avatar_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}
