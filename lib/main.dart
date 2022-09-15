import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          primarySwatch: Colors.blue,
        ),
        home: Container(color: Colors.green));
  }
}
