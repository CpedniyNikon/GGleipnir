import 'package:flutter/material.dart';

class UnAuthorizedAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UnAuthorizedAppBar({super.key});

  @override
  State<UnAuthorizedAppBar> createState() => _UnAuthorizedAppBarState();

  @override
  final Size preferredSize =const Size.fromHeight(kToolbarHeight);
}

class _UnAuthorizedAppBarState extends State<UnAuthorizedAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('GGleipnir'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Вход"),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Регистрация"),
        ),
      ],
      backgroundColor: Colors.green,
    );
  }
}
