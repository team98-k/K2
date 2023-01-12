import 'package:flutter/material.dart';

class OnSubmitPressed extends StatelessWidget {
  final String str;
  final Widget nb;

  const OnSubmitPressed({super.key, required this.str, required this.nb});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              str,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("확인"),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => nb),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}
