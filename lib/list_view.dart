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
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 21, color: Colors.amber),
        ),
      ),

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
        title: Text(
          "Flutter List View",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
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
    var arrNames = ['Fahim', 'Faiyaz', 'Akib', 'Rakib', 'Sakib'];

    return Scaffold(
      appBar: AppBar(title: Text("Flutter List View")),
      body: Column(
        children: [
          SizedBox(
            height: 120, // give height for first ListView
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  arrNames[index],
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              },
              itemCount: arrNames.length,
              reverse: false,
              itemExtent: 100,
              scrollDirection: Axis.horizontal,
            ),
          ),

          SizedBox(height: 20),
          // height must be enough for text
          ListView.separated(
            shrinkWrap: true, // 👈 makes it take only needed height
            physics: NeverScrollableScrollPhysics(), // 👈 disables scrolling
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1513682121497-80211f36a7d3?q=80&w=388&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                  ),
                ),
                title: Text(
                  arrNames[index],
                  style: TextStyle(fontFamily: 'fontMain', fontSize: 30),
                ),
                subtitle: Text(
                  "Number",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                trailing: Icon(Icons.add),
              );
            },
            itemCount: arrNames.length,
            reverse: false,
            separatorBuilder: (context, index) {
              return Divider(height: 40, thickness: 4);
            },
          ),
        ],
      ),
    );
  }
}
