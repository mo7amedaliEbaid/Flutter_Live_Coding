import 'package:flutter/material.dart';

main() {
  runApp(
    const MaterialApp(
      home: ExplicitAnimationExample(),
    ),
  );
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
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    sizeAnimation = Tween<double>(begin: 100, end: 300).animate(
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
      body: Center(
        child: AnimatedBuilder(
          animation: sizeAnimation,
          builder: (context, child) {
            return Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              color: Colors.blue,
              child: child,
            );
          },
          child: const Center(
            child: Text(
              "Flutter",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
        ),
      ),
    );
  }
}
