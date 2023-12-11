import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/WorkoutCard.dart';
import 'package:flutter/material.dart';

class PullWorkoutPage extends StatelessWidget {
  const PullWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36, bottom: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_bulk.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(
                route: '/bulk/workout',
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 4, top: 4),
                    margin: const EdgeInsets.only(top: 14, bottom: 14),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(25, 176, 0, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Text(
                      'Pull Workout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                  WorkoutCard(
                      title: 'Lat Pull Down',
                      desc: '5 Sets x 12 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/pull/1.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'T-Bar Row',
                      desc: '4 Sets x 12 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/pull/2.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Close Grip Cable Row',
                      desc: '5 Sets x 12 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/pull/3.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Cable Upright Row',
                      desc: '4 Sets x 12 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/pull/4.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Bicep Curl',
                      desc: '4 Sets x 12 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/pull/5.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const NavigationBarComponent(),
    );
  }
}
