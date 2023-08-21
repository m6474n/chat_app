import 'package:chat_app/auth/login.dart';
import 'package:chat_app/components/reusable_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final firestore = FirebaseFirestore.instance.collection('Users').snapshots();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: StreamBuilder<QuerySnapshot>(
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            snapshot:
            firestore;
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 42,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'User Name',
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Reusable(
                          icon: Icons.person,
                          title: 'Username',
                          text: snapshot.data!.docs[index]['name'].toString(),
                        );
                      }),
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        auth.signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        });
                      },
                      child: Text('Logout')),
                )
              ],
            );
          },
        ));
  }
}
