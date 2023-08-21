import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: .25))),
            child: ListTile(
              title: Text('Item $index'),
              subtitle: Text('Description'),
            ),
          );
        });
  }
}
