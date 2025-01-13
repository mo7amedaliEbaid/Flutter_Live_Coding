import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  final VoidCallback incrementFunction;
  final int counter;

  const CounterProvider({
    super.key,
    required this.incrementFunction,
    required this.counter,
    required super.child,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter;
  }
}

/*class CounterProvider extends InheritedWidget {
  const CounterProvider({
    super.key,
    required this.counter,
    required this.incrementFunction,
    required super.child,
  });

  final int counter;
  final VoidCallback incrementFunction;

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter;
  }
}*/

main() {
  runApp(MaterialApp(
    home: CounterScreen(),
  ));
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  incrementFunction() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: _counter,
      incrementFunction: incrementFunction,
      child: Scaffold(
        body: DisplayCounterWidget(),
      ),
    );
  }
}

class DisplayCounterWidget extends StatefulWidget {
  const DisplayCounterWidget({super.key});

  @override
  State<DisplayCounterWidget> createState() => _DisplayCounterWidgetState();
}

class _DisplayCounterWidgetState extends State<DisplayCounterWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Text(
            "${provider?.counter}",
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: provider?.incrementFunction,
            child: Text("Tap to Increment"),
          )
        ],
      ),
    );
  }
}

/*
void main() => runApp(MyApp());

class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback incrementCounter;

  const CounterProvider({
    super.key,
    required this.counter,
    required this.incrementCounter,
    required super.child,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InheritedWidget Demo',
      home: CounterHomePage(),
    );
  }
}

class CounterHomePage extends StatefulWidget {
  @override
  _CounterHomePageState createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: _counter,
      incrementCounter: _incrementCounter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Example'),
        ),
        body: const Center(
          child: CounterDisplay(),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Counter Value: ${counterProvider?.counter}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: counterProvider?.incrementCounter,
          child: const Text('Increment Counter'),
        ),
      ],
    );
  }
}
*/
