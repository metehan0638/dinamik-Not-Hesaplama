import 'package:dynamic_not/consts/constants.dart';
import 'package:dynamic_not/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Dinamik not hesaplama',
      debugShowCheckedModeBanner: false,
      home:const HomePage() ,
    theme: ThemeData(
      primarySwatch: Sabitler.mainColor,
    ),
    );
  }
}
