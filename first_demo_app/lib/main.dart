import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: ListApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  var lista = <String>[];

  // add method
  void addItem() {
    lista.add("List item");
    setState(() {});
  }

  void removeItem() {
    lista.remove("List item");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("List App")),
        centerTitle: true,
      ),
      body: ListView(
        children: lista
            .map((e) => ListTile(
                  title: Text(
                    e,
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    removeItem();
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[400],
      ),
    );
  }
}
