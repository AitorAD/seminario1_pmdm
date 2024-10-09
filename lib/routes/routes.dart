import 'package:flutter/material.dart';
import 'package:seminario_1/animated_container.dart';
import 'package:seminario_1/card_page.dart';
import 'package:seminario_1/home_temp.dart';
import 'package:seminario_1/alert_page.dart';
import 'package:seminario_1/avatar_page.dart';
import 'package:seminario_1/input_page.dart';
import 'package:seminario_1/listview_page.dart';
import 'package:seminario_1/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
