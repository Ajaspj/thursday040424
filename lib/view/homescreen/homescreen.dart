import 'package:flutter/material.dart';
import 'package:thursday040424/controll/homescreencontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchDAta();
    super.initState();
  }

  fetchDAta() async {
    await HomeScreencontroller.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HomeScreencontroller.addData();
          setState(() {});
        },
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await HomeScreencontroller.getAllData();
                  setState(() {});
                },
                child: Text("get")),
            Column(
              children: List.generate(
                  HomeScreencontroller.data.length,
                  (index) => ListTile(
                        title: Text(HomeScreencontroller.studentlist[index].name
                            .toString()),
                        subtitle: Text(HomeScreencontroller
                            .studentlist[index].ph
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await HomeScreencontroller.deleteData(
                                      HomeScreencontroller
                                          .studentlist[index].id);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () async {
                                  await HomeScreencontroller.editData(
                                      HomeScreencontroller
                                          .studentlist[index].id);
                                  setState(() {});
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
