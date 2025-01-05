// Animated Button

import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimatedButtonScreen(),
  ));
}

class AnimatedButtonScreen extends StatefulWidget {
  const AnimatedButtonScreen({super.key});

  @override
  State<AnimatedButtonScreen> createState() => _AnimatedButtonScreenState();
}

class _AnimatedButtonScreenState extends State<AnimatedButtonScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: _isExpanded ? 300 : 100,
            height: _isExpanded ? 300 : 100,
            color: Colors.red,
            child: const Center(
                child: Text(
              "Tap me",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
