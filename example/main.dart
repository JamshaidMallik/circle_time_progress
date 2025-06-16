import 'package:circle_time_progress/circle_time_progress.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Gradient Circular Progress')),
        body: Center(
          child: GradientCircularProgressIndicator(
            value: 0.7,
            size: 150,
            strokeWidth: 12,
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.pink],
            ),
            backgroundColor: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
