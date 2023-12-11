import 'package:aplikasi_body_goals/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeatureButton extends StatefulWidget {
  final String route;
  final String title;
  final String image;

  const FeatureButton({
    super.key,
    required this.route,
    required this.title,
    required this.image,
  });

  @override
  State<FeatureButton> createState() => _FeatureButtonState();
}

class _FeatureButtonState extends State<FeatureButton> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return InkWell(
      onTap: () => {
        if (widget.route == '/bulk/workout')
          {
            appState.setpageAfterWorkoutStatus('body'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/bulk/nutrition')
          {
            appState.setpageAfterWorkoutStatus('nutrition'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/bulk/trainer')
          {
            appState.setpageAfterWorkoutStatus('trainer'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/bulk/review')
          {
            appState.setpageAfterWorkoutStatus('review'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/cut/workout')
          {
            appState.setpageAfterWorkoutStatus('body'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/cut/nutrition')
          {
            appState.setpageAfterWorkoutStatus('nutrition'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/cut/trainer')
          {
            appState.setpageAfterWorkoutStatus('trainer'),
            appState.setBulkStatus(true)
          },
        if (widget.route == '/cut/review')
          {
            appState.setpageAfterWorkoutStatus('review'),
            appState.setBulkStatus(true)
          },
        Navigator.pushReplacementNamed(context, widget.route),
      }, //  Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => const WorkoutPage()),
      // )
      child: Container(
        margin: const EdgeInsets.only(top: 18),
        width: MediaQuery.of(context).size.width,
        constraints:const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: const Color.fromRGBO(25, 176, 0, 1), width: 3.0),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(widget.image),
              width: 50,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                  color: Color.fromRGBO(25, 176, 0, 1),
                  fontWeight: FontWeight.w800,
                  fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
