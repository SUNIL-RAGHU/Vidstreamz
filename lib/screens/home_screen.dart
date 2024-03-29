import 'package:flutter/material.dart';

import 'package:vidstreamz/screens/meeting_screen.dart';

import '../Widgets/custom_button.dart';
import '../resources/auth_methods.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  onPageTab(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> Pages = [
    MeetingScreen(),
    // const HistoryMeetingScreen(),
    // const Text('Profile'),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: const Text(
            'Chat Now',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageTab,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Profile',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.settings_outlined,
            //   ),
            //   label: 'Settings',
            // ),
          ],
        ),
      ),
    );
  }
}
