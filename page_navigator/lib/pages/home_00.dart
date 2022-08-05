import 'package:flutter/material.dart';
import 'package:page_navigator/pages/page_01.dart';

class Home00 extends StatefulWidget {
  const Home00({Key? key}) : super(key: key);

  @override
  State<Home00> createState() => _Home00State();
}

class _Home00State extends State<Home00> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'GoWith:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Home01(
                        prevPageargs: 'MaterialPageRoute',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.deepPurple[700],
                        fixedSize: Size(170, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))
                    .copyWith(
                  elevation: ButtonStyleButton.allOrNull(20),
                ),
                child: const Text(
                  'MaterialRoute',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('Home01');
                },
                style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.deepPurple[700],
                        fixedSize: Size(170, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)))
                    .copyWith(
                  elevation: ButtonStyleButton.allOrNull(20),
                ),
                child: const Text(
                  'NamedRoute',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
