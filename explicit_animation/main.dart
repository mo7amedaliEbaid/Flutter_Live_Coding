import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: ExplicitAnimationExample(),
  ));
}

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({super.key});

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween<double>(begin: 100, end: 300).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controller.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explicit Animation Example"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              width: animation.value,
              height: animation.value,
              color: Colors.blue,
              child: child,
            );
          },
          child: const Center(
            child: Text("Flutter"),
          ),
        ),
      ),
    );
  }
}
