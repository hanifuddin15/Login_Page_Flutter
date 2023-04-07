import 'package:flutter/material.dart';
import 'package:login_page_flutter/login_page.dart';
// import 'package:meme_editor/memelist.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  //change

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),   //type your page name here
      debugShowCheckedModeBanner: false,
    );
  }
}