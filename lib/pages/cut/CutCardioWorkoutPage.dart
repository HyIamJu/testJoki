import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/WorkoutCard.dart';
import 'package:flutter/material.dart';

class CutCardioWorkoutPage extends StatelessWidget {
  const CutCardioWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36, bottom: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_cardio.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(
                route: '/cut/workout',
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
                      'Cardio Workout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                  WorkoutCard(
                      title: 'Walking',
                      desc: 'Min. 10\nminute',
                      // desc2: '1.5 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/1.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        // Image.asset(
                        //   'assets/cardio/2.png',
                        //   height: 100,
                        //   fit: BoxFit.cover,
                        // )
                      ]),
                  WorkoutCard(
                      title: 'Running',
                      desc: 'Min. 7\nminute',
                      // desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/2.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/cardio/3.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Jump Rope',
                      desc: '3 Sets x 1 Minute',
                      desc2: '30 Second Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/4.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Elbow to Knee Twist',
                      desc: '5 Sets x 20 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/5.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Push up to Toe',
                      desc: '5 Sets x 20 Reps',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/6.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/cardio/7.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Mountain Climber',
                      desc: '5 Sets x 30 Second',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/8.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  WorkoutCard(
                      title: 'Jumping Jack',
                      desc: '5 Sets x 30 Second',
                      desc2: '1 Minute Rest',
                      children: [
                        Image.asset(
                          'assets/cardio/9.png',
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
