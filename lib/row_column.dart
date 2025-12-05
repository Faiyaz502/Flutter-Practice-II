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
      home: RowExample(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RowExample extends StatefulWidget {
  const RowExample({super.key});

  @override
  State<RowExample> createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Row And Column"),
        backgroundColor: const Color.fromARGB(255, 28, 119, 194),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                    Text('Row1', style: TextStyle(fontSize: 20)),
                    Text('Row2', style: TextStyle(fontSize: 20)),
                    Text('Row3', style: TextStyle(fontSize: 20)),
                    Text('Row4', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Text('A', style: TextStyle(fontSize: 20)),
              Text('B', style: TextStyle(fontSize: 20)),
              Text('C', style: TextStyle(fontSize: 20)),
              Text('D', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  print("Clicked the Eleveted Button");
                },
                child: Text('Button'),
              ),

              //Ink-well Widget
              InkWell(
                onTap: () {
                  print('Tapped on Contianer');
                },
                onLongPress: () {
                  print('Long Pressed on Container');
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 16.0),
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),

                    child: Text(
                      "Contiainer with \n action on tap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Tapped on Contianer');
                },
                onLongPress: () {
                  print('Long Pressed on Container');
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 16.0),
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),

                    child: Text(
                      "Contiainer with \n action on tap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Tapped on Contianer');
                },
                onLongPress: () {
                  print('Long Pressed on Container');
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 16.0),
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),

                    child: Text(
                      "Contiainer with \n action on tap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Tapped on Contianer');
                },
                onLongPress: () {
                  print('Long Pressed on Container');
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 16.0),
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),

                    child: Text(
                      "Contiainer with \n action on tap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Tapped on Contianer');
                },
                onLongPress: () {
                  print('Long Pressed on Container');
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(top: 16.0),
                    height: 200,
                    decoration: BoxDecoration(color: Colors.amber),

                    child: Text(
                      "Contiainer with \n action on tap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
