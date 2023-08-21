import 'package:chat_app/Screens/homeScreen.dart';
import 'package:chat_app/Screens/message_screen.dart';
import 'package:chat_app/Screens/people.dart';
import 'package:chat_app/Screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> widList = [
    HomeScreen(),
    PeopleScreen(),
    Center(child: Text('Friends')),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text('Chat App'),
        ),
        elevation: 3,
        backgroundColor: Colors.white,
      ),
      body: widList.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MesssageScreen()));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: GNav(
        tabs: [
          GButton(
            icon: Icons.home,
            onPressed: () {},
            text: 'Home',
          ),
          GButton(
            icon: Icons.people,
            onPressed: () {},
            text: 'People',
          ),
          GButton(
            icon: Icons.phone,
            onPressed: () {},
            text: 'Calls',
          ),
          GButton(
            icon: Icons.person,
            onPressed: () {},
            text: 'profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
