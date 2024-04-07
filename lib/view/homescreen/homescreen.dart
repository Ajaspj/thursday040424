import 'package:flutter/material.dart';
import 'package:thursday040424/controll/homescreencontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await HomeScreencontroller.getAllData();
                  setState(() {});
                },
                child: const Text('get data'),
              ),
              ...List.generate(
                HomeScreencontroller.studentlist.length,
                (index) => ListTile(
                  title: Text(HomeScreencontroller.studentlist[index].name),
                  subtitle: Text(
                      HomeScreencontroller.studentlist[index].ph.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await HomeScreencontroller.editData(
                              HomeScreencontroller.studentlist[index].id);
                          setState(() {});
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await HomeScreencontroller.deleteData(
                              HomeScreencontroller.studentlist[index].id);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HomeScreencontroller.addData();
          setState(() {});
        },
      ),
    );
  }
}
