import 'package:flutter/material.dart';
import 'pages/home/balance_navigator_bar.dart';
import 'pages/home/home_navigation_bar.dart';
import 'pages/home/pertil_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  // int _bottomNavigationBarIndex = 0;
  String name = 'Domingos';
  String email = 'domingosf.lequechane@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        title: const Text('AppBar'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                  child: Text(
                name[0],
              )),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.account_balance_sharp),
              onTap: () {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Balance',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.account_balance_wallet_rounded),
              onTap: () {
                _pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Perfil',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.account_box_rounded),
              onTap: () {
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          Home(),
          Balance(),
          Peril(),
        ],
      ),
    );
  }
}
