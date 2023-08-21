import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  const Reusable(
      {super.key, required this.icon, required this.text, required this.title});

  final String title, text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18),
        )
      ]),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: .3, color: Colors.grey),
      )),
    );
  }
}
