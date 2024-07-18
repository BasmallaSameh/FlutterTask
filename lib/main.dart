import 'package:flutter/material.dart';
import 'package:project/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 16.0,
              fontFamily: AutofillHints.addressCity,
              color: Color.fromARGB(234, 4, 1, 47),
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.none),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
