import 'package:flutter/material.dart';
import 'package:thursday040424/controll/homescreencontroller.dart';
import 'package:thursday040424/view/homescreen/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreencontroller.initDb();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
