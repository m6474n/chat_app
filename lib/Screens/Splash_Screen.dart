import 'package:chat_app/services/splash_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService service = SplashService();

  @override
  void initState() {
    service.isLogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Chat App",
        style: TextStyle(
            fontSize: 32,
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold),
      ),
    ));
  }
}
