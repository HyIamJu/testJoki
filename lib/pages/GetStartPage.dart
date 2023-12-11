import 'package:aplikasi_body_goals/components/TrapesiumButton.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_app.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(top: 28, bottom: 28),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Color.fromRGBO(25, 176, 0, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    Stack(
                      children: [
                        Text(
                          'Body',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.0
                              ..color = Colors.white,
                          ),
                        ),
                        const Text(
                          'Body',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-3.0, -18.0),
                      child: const Text(
                        'Goals!',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0.0, -18.0),
                      child: const Text(
                        'Get Fit\nFeel Great\nReach Your\nBody Goals',
                        style: TextStyle(
                          color: Color.fromRGBO(25, 176, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: TrapesiumButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
                // MaterialPageRoute(builder: (context) => const LoginPageNew());
              },
              child: const Text('Get Start >'),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
