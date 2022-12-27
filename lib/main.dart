import 'package:flutter/material.dart';
import 'package:k2/screen/first_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "K2",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: const [
          SizedBox(
            child: Text("hello k2"),
          ),
          FirstScreen(),
        ],
      )),
    );
  }
}
