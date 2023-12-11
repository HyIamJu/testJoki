import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/WorkoutCard.dart';
import 'package:flutter/material.dart';

class CutLegWorkoutPage extends StatelessWidget {
  const CutLegWorkoutPage({Key? key}) : super(key: key);

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
                route: '/cut/workout/body',
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
                      'Leg Workout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                  WorkoutCard(
                      title: 'Squat',
                      desc: '4 Sets x 12 Reps',
                      desc2: '1.5 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/leg/1.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        // Image.asset(
                        //   'assets/leg/2.png',
                        //   height: 100,
                        //   fit: BoxFit.cover,
                        // )
                      ]),
                  WorkoutCard(
                      title: 'Leg Press',
                      desc: '5 Sets x 10 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/leg/3.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Leg Extension',
                      desc: '5 Sets x 10 Reps',
                      desc2: '30 Second Rest',
                      children: [
                        Image.asset(
                          'assets/leg/4.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Hamstring Curl',
                      desc: '4 Sets x 12 Reps',
                      desc2: '30 Second Rest',
                      children: [
                        Image.asset(
                          'assets/leg/5.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Calf Rise',
                      desc: '3 Sets x 15 Reps',
                      desc2: '30 Second Rest',
                      children: [
                        Image.asset(
                          'assets/leg/6.png',
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
