import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool center;

  const TopBar(
      {Key? key,
      required this.appBar,
      required this.title,
      this.center = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
