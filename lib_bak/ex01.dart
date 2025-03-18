import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const LittlePrinceIntro(),
    );
  }
}

class LittlePrinceIntro extends StatelessWidget {
  const LittlePrinceIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A237E),
      appBar: AppBar(
        title: const Text('我的最愛'),
        backgroundColor: const Color.fromARGB(255, 191, 166, 233),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text(
          '在浩瀚宇宙中的 B612 小行星上',
          style: TextStyle(
            fontSize: 24,
            height: 1.5,
            color: Colors.amber[100],
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
