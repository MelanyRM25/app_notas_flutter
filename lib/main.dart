import 'package:flutter/material.dart';
import 'package:notas_app/pages/login.dart';
import 'package:localstorage/localstorage.dart';


void main() async {
  await initLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Login_Screen()
    );
  }
}
