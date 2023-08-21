import 'package:chat_app/homepage.dart';
import 'package:chat_app/services/session_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool toggle = false;
  final firestore = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  var id;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void Register(BuildContext context, String email, String password) {
    setLoading(true);
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      SessionController.userId = value.user!.uid.toString();
      id = value.user!.uid.toString();
      firestore.doc(id).set({
        'id': id,
        'email': email,
        'password': password,
        'name': '',
        'phone': '',
        'image': '',
        'online': true,
        'onlineStatus': 'online',
        'onlineTime': Timestamp.now().toDate(),
        'onlineSince': Timestamp.now().toDate(),
        'onlineSinceTime': Timestamp.now().toDate(),
        'onlineSinceTimestamp': Timestamp.now().toDate(),
      });
      setLoading(false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((e) {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    });
  }
}
