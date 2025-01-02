import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

main() {
  runApp(const MaterialApp(
    home: HomePageScreen(),
  ));
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Provider Example"),
        ),
        body: Consumer<CounterProvider>(
          builder: (context, counterProvider, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Counter Value = ${counterProvider.counter}"),
                  MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: Text("Increment"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrement();
                    },
                    child: Text("decrement"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
