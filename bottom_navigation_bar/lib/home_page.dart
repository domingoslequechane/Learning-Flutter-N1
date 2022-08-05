import 'package:bottom_navigation_bar/pages/home/home_navigation_bar.dart';
import 'package:bottom_navigation_bar/pages/home/pertil_navigator_bar.dart';
import 'package:flutter/material.dart';

import 'pages/home/balance_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _bottomNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        title: const Text('AppBar'),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          Home(),
          Balance(),
          Peril(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationBarIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavigationBarIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
