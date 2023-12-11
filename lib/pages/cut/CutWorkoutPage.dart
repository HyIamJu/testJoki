import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/NoteCardComponent.dart';
import 'package:aplikasi_body_goals/components/WorkoutButtonCardComponent.dart';
import 'package:aplikasi_body_goals/components/gridProgramComponent.dart';
import 'package:aplikasi_body_goals/model/program_recommendation_model.dart';
import 'package:flutter/material.dart';

class CutWorkoutPage extends StatefulWidget {
  const CutWorkoutPage({Key? key}) : super(key: key);

  @override
  _CutWorkoutPageState createState() => _CutWorkoutPageState();
}

class _CutWorkoutPageState extends State<CutWorkoutPage> {
  List<ProgramRecom> dummyProgram = [
    ProgramRecom(status: 'white', text: 'Push &\nCardio'),
    ProgramRecom(status: 'green', text: 'Rest\nDay'),
    ProgramRecom(status: 'white', text: 'Pull &\nCardio'),
    ProgramRecom(status: 'white', text: 'Leg \nWorkout'),
    ProgramRecom(status: 'green', text: 'Rest\nDay'),
    ProgramRecom(status: 'white', text: 'Cardio \nWorkout'),
    ProgramRecom(status: 'repeat'),
  ];
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
                route: '/cut',
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  const NoteCard(
                    title: 'Notes : ',
                    subtitle:
                        'Choose variants and weights\nbased on your capabilities.',
                  ),
                  const WorkoutButtonCard(
                    route: '/cut/workout/cardio',
                    image: 'assets/push.png',
                    title: 'Cardio\nWorkout',
                  ),
                  const WorkoutButtonCard(
                    route: '/cut/workout/body',
                    image: 'assets/push.png',
                    title: 'Body\nWorkout',
                  ),
                  const SizedBox(height: 28),
                  ProgramRecommendation(list: dummyProgram, height: 400),
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
