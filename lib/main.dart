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
      body: Center(
        child: Text(
          '在浩瀚宇宙中的 B612 小行星上，\n'
          '住著一位金髮的小王子。\n\n'
          '他的星球很小，小得只需要三步就能繞行一圈，\n'
          '卻擁有三座火山和一朵永遠綻放的玫瑰。\n\n'
          '小王子每天都會照顧他的玫瑰，\n'
          '清理火山，守護著這個獨特的小世界。\n\n'
          '這裡的日落很特別，\n'
          '小王子只要把椅子挪動幾步，\n'
          '就能欣賞到四十四次的夕陽。',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            height: 1.5,
            color: Colors.amber[100],
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
            shadows: const [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
