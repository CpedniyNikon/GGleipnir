import 'package:flutter/material.dart';

class AuthorizedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AuthorizedAppBar({super.key});

  @override
  State<AuthorizedAppBar> createState() => _AuthorizedAppBarState();

  @override
  final Size preferredSize =const Size.fromHeight(kToolbarHeight);
}

class _AuthorizedAppBarState extends State<AuthorizedAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('GGleipnir'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Profile"),
        ),
      ],
      backgroundColor: Colors.green,
    );
  }

}
