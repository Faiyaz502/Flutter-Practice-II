import 'package:flutter/material.dart';

void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Card(
            elevation: 10,
            shadowColor: Colors.amber,
            surfaceTintColor: Colors.red,
            color: Colors.brown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hello",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
