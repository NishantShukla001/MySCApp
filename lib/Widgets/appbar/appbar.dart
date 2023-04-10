import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onProfilePressed;
  final VoidCallback onNotificationPressed;

  MyAppBar({
    required this.title,
    required this.onProfilePressed,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          // color: Constants.appOrangeColor,
          fontSize: 25,
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: onNotificationPressed,
        ),
        IconButton(
          onPressed: onProfilePressed,
          icon: const Icon(Icons.person),
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
