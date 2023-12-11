import 'package:flutter/material.dart';

class LogoTopComponent extends StatelessWidget {
  const LogoTopComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 28, bottom: 28),
        child: const Image(
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
