import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Adding SharedPreferences

class CounterProvider extends ChangeNotifier {
  CounterProvider() {
    _initialize();
  }

  int _counter = 0;

  int get counter => _counter;

  SharedPreferences? _prefs;

  bool get isInitialized => _isInitialized;

  bool _isInitialized = false;

  Future<void> _initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _counter = _prefs?.getInt('counter') ?? 0;
    _isInitialized = true;
    notifyListeners();
  }

  void _saveToPrefs() {
    _prefs?.setInt('counter', _counter);
  }

  void increment() {
    _counter++;
    _saveToPrefs();
    notifyListeners();
  }

  void decrement() {
    _counter--;
    _saveToPrefs();
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: const CounterContent(),
      ),
    );
  }
}

class CounterContent extends StatelessWidget {
  const CounterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterState, child) {
        if (counterState.isInitialized) {
          return const Center(
            child: Text("Shared Preferences is Initialized"),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Counter Value: ${counterState.counter}"),
            ),
            MaterialButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Text("Increment"),
            ),
            MaterialButton(
              onPressed: () {
                if (counterState.counter <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Negative values are not allowed"),
                    ),
                  );
                } else {
                  context.read<CounterProvider>().decrement();
                }
              },
              child: const Text("Decrement"),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: CounterScreen(),
    ),
  );
}
