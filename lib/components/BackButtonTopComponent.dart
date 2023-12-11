import 'package:aplikasi_body_goals/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackButtonTopComponent extends StatefulWidget {
  final String route;

  const BackButtonTopComponent({Key? key, required this.route})
      : super(key: key);

  @override
  _BackButtonTopComponentState createState() => _BackButtonTopComponentState();
}

class _BackButtonTopComponentState extends State<BackButtonTopComponent> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => {
          if (widget.route == '/dashboard') {appState.setBulkStatus(false)},
          if (widget.route == '/bulk') {appState.setBulkStatus(false)},
          if (widget.route == '/cut') {appState.setBulkStatus(false)},
          Navigator.pushReplacementNamed(context, widget.route),
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 15,
                )),
            const SizedBox(width: 8.0),
            const Text(
              'Back',
              style: TextStyle(color: Colors.white, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
