import 'package:flutter/material.dart';

class MesssageScreen extends StatefulWidget {
  const MesssageScreen({super.key});

  @override
  State<MesssageScreen> createState() => _MesssageScreenState();
}

class _MesssageScreenState extends State<MesssageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const ListTile(
        leading: CircleAvatar(),
        title: Text('User'),
        trailing: Icon(Icons.more_horiz),
      )),
      body: Column(children: [
        Spacer(),
        Container(
          padding: EdgeInsets.all(12),
          height: 80,
          width: double.infinity,
          color: Colors.grey,
          child: Row(children: [
            Icon(Icons.add),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                height: 70,
                child: TextFormField(
                  validator: (value) {
                    return value!.isEmpty ? 'Enter password!' : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(18),
                      filled: true,
                      hintText: 'Send Message',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
            ),
            Icon(Icons.send)
          ]),
        )
      ]),
    );
  }
}
