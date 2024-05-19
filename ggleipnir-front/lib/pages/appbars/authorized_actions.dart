import 'package:flutter/material.dart';

List<Widget> authorizedActions() {
  return <Widget>[
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Profile"),
    ),
    InkWell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Log out"),
      ),
    ),
  ];
}
