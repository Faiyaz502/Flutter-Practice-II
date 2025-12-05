import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: ContainerExample(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerExample extends StatefulWidget {
  const ContainerExample({super.key});

  @override
  State<ContainerExample> createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Container"),
        backgroundColor: const Color.fromARGB(255, 28, 119, 194),
      ),
      body: Center(
        child: ListView(
          children: [
            //Container Example
            Container(
              width: 300,
              height: 150,
              color: const Color.fromARGB(255, 0, 174, 255),
              child: Center(
                child: Text(
                  "Hello World!!!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            //Button Example
            Center(child: Text("Buttons", style: TextStyle(fontSize: 30))),
            SizedBox(height: 10),

            TextButton(
              onPressed: () => {print("Text Button Clicked!!!")},
              onLongPress: () => {print("Long Pressed!!!")},
              child: Text("Click Here !!!!"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // button background
                foregroundColor: Colors.white, // text color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // rounded corners
                ),
              ),
              onPressed: () {
                print("Elevated Button Clicked!!!");
              },
              child: Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {
                print("Outlined Button Clicked!!!");
              },
              child: Text("Outlined Button "),
            ),

            //Images
            Image.asset('assets/anna-pelzer-IGfIGP5ONV0-unsplash.jpg'),
            GestureDetector(
              onTap: () {
                print("GIF icon clicked!");
              },
              child: Image.asset(
                'assets/icons8-fire-heart.gif', // your GIF path
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
