import 'package:flutter/material.dart';
import 'package:k2/widgets/top_bar.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(title: 'K2'),
      body: Center(child: Text('K2')),
    );
  }
}
