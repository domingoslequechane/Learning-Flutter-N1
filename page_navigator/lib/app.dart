import 'package:flutter/material.dart';
import 'package:page_navigator/pages/page_01.dart';

import 'pages/home_00.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const Home00(),
        'Home01': (_) => const Home01(prevPageargs: 'NamedRoute'),
      },
    );
  }
}
