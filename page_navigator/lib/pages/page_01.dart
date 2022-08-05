import 'package:flutter/material.dart';

class Home01 extends StatelessWidget {
  final String prevPageargs;
  const Home01({Key? key, required this.prevPageargs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'P1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Comming with $prevPageargs',
                style: const TextStyle(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
                  'Back',
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
