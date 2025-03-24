import 'package:flutter/material.dart';
import 'ai_gen_page.dart';
import 'wills_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getHomePage(),
    );
  }

  Widget getHomePage() {
    bool isWills = true;
    if (isWills == true) {
      return WillsPage();
    } else {
      return AiGenPage();
    }
  }
}
