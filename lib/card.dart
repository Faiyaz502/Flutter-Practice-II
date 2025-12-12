import 'package:flutter/material.dart';

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
      home: CardExample(),
    );
  }
}

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Card(
                elevation: 10,
                shadowColor: Colors.amber,
                surfaceTintColor: Colors.red,
                color: Colors.brown,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Current Year : ${time.year} Month:  ${time.month} Weekday:  ${time.weekday} Time- ${time.hour}: ${time.minute}',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    time = DateTime.now();
                  });
                },
                child: Text("Get Time "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
