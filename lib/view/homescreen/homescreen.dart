import 'package:flutter/material.dart';
import 'package:thursday040424/controll/homescreencontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initstate() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await HomeScreencontroller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HomeScreencontroller.addData();
          setState(() {});
        },
      ),
      body: Center(
        child: Column(
          children: [
            Column(children: List.generate(10, (index) => Text("bsbb"))),
          ],
        ),
      ),
    );
  }
}
