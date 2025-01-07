// didUpdateWidget

import 'package:flutter/material.dart';

main() {
  runApp(
    const MaterialApp(
      home: ParentWidget(),
    ),
  );
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  Color _color = Colors.blue;

  _toggleColor() {
    setState(() {
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChildWidget(
          color: _color,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key, required this.color});

  final Color color;

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  Color? color;

  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    if (oldWidget.color != widget.color) {
      setState(() {
        color = widget.color;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: color,
    );
  }
}

/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'didUpdateWidget Demo',
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> with WidgetsBindingObserver{
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state==AppLifecycleState.paused){

    }
    super.didChangeAppLifecycleState(state);
  }
  Color _color = Colors.blue;

  void _toggleColor() {
    setState(() {
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('didUpdateWidget Example')),
      body: Center(
        child: StatefulChildWidget(color: _color),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        child: Icon(Icons.color_lens),
      ),
    );
  }
}

class StatefulChildWidget extends StatefulWidget {
  final Color color;

  const StatefulChildWidget({Key? key, required this.color}) : super(key: key);

  @override
  _StatefulChildWidgetState createState() => _StatefulChildWidgetState();
}

class _StatefulChildWidgetState extends State<StatefulChildWidget> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.color; // Initialize with the widget's initial color.
  }

  @override
  void didUpdateWidget(StatefulChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the color has changed, and update the state if necessary.
    if (widget.color != oldWidget.color) {
      setState(() {
        _currentColor = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: _currentColor,
      child: Center(
        child: Text(
          'Color Box',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
*/
