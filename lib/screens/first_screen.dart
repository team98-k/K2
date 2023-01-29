import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:k2/widgets/top_bar.dart';

import 'home_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String test = "test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(
        title: 'Test',
      ),
      body: SizedBox(
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
            FirebaseFirestore.instance.collection('test').add({"test": test});
          },
          child: const Center(
            child: Text(
              "Test",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
