import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CustomWidget(), debugShowCheckedModeBanner: false);
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widgets")),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 200,
              color: Colors.blue,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 40,
                    ),
                  );
                },
                itemCount: 8,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("NAME"),
                    subtitle: Text("Mobile Number"),
                    leading: CircleAvatar(backgroundColor: Colors.black),
                    trailing: Icon(Icons.message),
                  );
                },
                itemCount: 8,
              ),
            ),
          ),
          Expanded(flex: 2, child: Container(height: 200, color: Colors.amber)),
          Categoruy(),
        ],
      ),
    );
  }
}

class Categoruy extends StatelessWidget {
  const Categoruy({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 200,
        color: Colors.blue,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundColor: Colors.green, radius: 40),
            );
          },
          itemCount: 8,
        ),
      ),
    );
  }
}

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
