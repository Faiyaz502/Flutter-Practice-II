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
      title: "Flutter List View Example",
      home: ListViewFetchData(),
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter List View"),
        backgroundColor: const Color.fromARGB(255, 233, 68, 68),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'One',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Two',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Three ',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'four',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewFetchData extends StatefulWidget {
  const ListViewFetchData({super.key});

  @override
  State<ListViewFetchData> createState() => _ListViewFetchDataState();
}

class _ListViewFetchDataState extends State<ListViewFetchData> {
  @override
  Widget build(BuildContext context) {
    var arr_names = ['Fahim', 'Faiyaz', 'Akib', 'Rakib', 'Sakib'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter List View"),
        backgroundColor: const Color.fromARGB(255, 233, 68, 68),
      ),
      body:
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return Text(
          //       arr_names[index],
          //       style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
          //     );
          //   },
          //   itemCount: arr_names.length,
          //   reverse: false,
          //   itemExtent: 100,
          //   scrollDirection: Axis.horizontal,
          // ),
          ListView.separated(
            itemBuilder: (context, index) {
              return Text(
                arr_names[index],
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
              );
            },
            itemCount: arr_names.length,
            reverse: false,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 100, thickness: 4);
            },
          ),
    );
  }
}
