import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(FlutterTaskApp());
}

class FlutterTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberGrid(),
    );
  }
}

class NumberGrid extends StatefulWidget {
  @override
  _NumberGridState createState() => _NumberGridState();
}

class _NumberGridState extends State<NumberGrid> {
  String selectedRule = 'Odd Numbers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Grid Task"),
        actions: [
          DropdownButton<String>(
            value: selectedRule,
            onChanged: (String? newRule) {
              setState(() {
                selectedRule = newRule!;
              });
            },
            items: <String>[
              'Odd Numbers',
              'Even Numbers',
              'Prime Numbers',
              'Fibonacci Numbers'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: 100,
        itemBuilder: (context, index) {
          int number = index + 1;
          bool isHighlighted = _shouldHighlight(number, selectedRule);
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.blue : Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 16,
                color: isHighlighted ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
