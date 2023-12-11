import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/NoteCardComponent.dart';
import 'package:aplikasi_body_goals/components/WorkoutButtonCardComponent.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CutWorkoutBodyPage extends StatefulWidget {
  const CutWorkoutBodyPage({Key? key}) : super(key: key);

  @override
  _CutWorkoutBodyPageState createState() => _CutWorkoutBodyPageState();
}

class _CutWorkoutBodyPageState extends State<CutWorkoutBodyPage> {
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
                route: '/cut/workout',
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  const NoteCard(
                    title: 'Notes :',
                    subtitle:
                        'Choose variants and weights\nbased on your capabilities.',
                  ),
                  const WorkoutButtonCard(
                    route: '/cut/workout/push',
                    image: 'assets/push.png',
                    title: 'Push\nWorkout',
                    subtitle: '(Chest, Shoulder, Tricep)',
                  ),
                  const WorkoutButtonCard(
                    route: '/cut/workout/pull',
                    image: 'assets/pull.png',
                    title: 'Pull\nWorkout',
                    subtitle: '(Traps, Lats, Rear Deltoid)',
                  ),
                  const WorkoutButtonCard(
                    route: '/cut/workout/leg',
                    image: 'assets/leg.png',
                    title: 'Leg\nWorkout',
                    subtitle: '(Quads, Hamstring, Calf)',
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Info : ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, right: 8.0),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Repetition : ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(25, 176, 0, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: 'unending cycle of the same moves.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 8.0, right: 8.0),
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Set : ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(25, 176, 0, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text:
                                          'a series of exercises done continuously',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 4, top: 4),
                          margin: const EdgeInsets.only(top: 14, bottom: 14),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(25, 176, 0, 1),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Gym',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                text: 'Find the nearest gym ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'here >>',
                                style: const TextStyle(
                                  color: Color.fromRGBO(25, 176, 0, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchGoogleMaps();
                                  },
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
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

  _launchGoogleMaps() async {
    final url = Uri.parse('https://www.google.com/maps');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
