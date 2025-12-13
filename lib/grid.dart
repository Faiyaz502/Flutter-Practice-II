import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(FoodDeliveryApp());
}

// ignore: must_be_immutable
class FoodDeliveryApp extends StatelessWidget {
  FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 162, 189, 197),
        fontFamily: 'Poppins',
      ),
      home: GridExample(),
    );
  }
}

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  var arrClr = [
    Colors.amber,
    Colors.red,
    Colors.lightBlue,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.lightGreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(color: arrClr[0]),
                  Container(color: arrClr[1]),
                  Container(color: arrClr[3]),
                  Container(color: arrClr[4]),
                  Container(color: arrClr[5]),
                ],
              ),
            ),
            SizedBox(height: 10),

            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.extent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(color: arrClr[0]),
                  Container(color: arrClr[1]),
                  Container(color: arrClr[3]),
                  Container(color: arrClr[4]),
                  Container(color: arrClr[5]),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(color: arrClr[index]);
                },
                itemCount: arrClr.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
