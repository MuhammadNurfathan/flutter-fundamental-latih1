import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final String? title; // Title bisa null agar opsional
  final Widget body;

  const CustomScaffold({Key? key, this.title, required this.body}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null
          ? AppBar(
              title: Text(widget.title!),
              backgroundColor: Colors.lightBlue,
              centerTitle: true,
            )
          : null, // Jika title null, AppBar tidak akan muncul
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.body,
            const SizedBox(height: 20),
            const Text(
              'Counter:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment Counter',
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
