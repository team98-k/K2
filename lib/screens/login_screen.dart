import 'package:flutter/material.dart';
import 'package:k2/widgets/bottom_navi.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn Page'),
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
        ],
      ),
      bottomNavigationBar: const BottomNavi(),
    );
  }
}
