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
      home: CallBackExample(),
    );
  }
}

class CallBackExample extends StatefulWidget {
  const CallBackExample({super.key});

  @override
  State<CallBackExample> createState() => _CallBackExampleState();
}

class _CallBackExampleState extends State<CallBackExample> {
  callBack() {
    print("Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: callBack,
              child: Text("CallBackFunction"),
            ),
          ],
        ),
      ),
    );
  }
}
