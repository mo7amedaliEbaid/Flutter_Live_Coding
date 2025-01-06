// didchangeDependencies

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: ExampleScreen(),
  ));
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  String? text;

  @override
  void initState() {
    text = "Portrait Text";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (MediaQuery.sizeOf(context).width > 500) {
      setState(() {
        text = "LandScape Text";
      });
    } else {
      setState(() {
        text = "Portrait Text";
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text.toString()),
      ),
    );
  }
}
