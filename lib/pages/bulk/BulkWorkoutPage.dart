import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/gridProgramComponent.dart';
import 'package:aplikasi_body_goals/model/program_recommendation_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BulkWorkoutPage extends StatefulWidget {
  const BulkWorkoutPage({Key? key}) : super(key: key);

  @override
  _BulkWorkoutPageState createState() => _BulkWorkoutPageState();
}

class _BulkWorkoutPageState extends State<BulkWorkoutPage> {
  List<ProgramRecom> dummyProgram = [
    ProgramRecom(status: 'white', text: 'Push\nWorkout'),
    ProgramRecom(status: 'white', text: 'Pull\nWorkout'),
    ProgramRecom(status: 'white', text: 'Leg \nWorkout'),
    ProgramRecom(status: 'green', text: 'Rest\nDay'),
    ProgramRecom(status: 'repeat'),
  ];
  // Future<void>? _launched;
  // Future<void> _launchInBrowser(Uri url) async {
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

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
                route: '/bulk',
              ),
            ),
            const SizedBox(height: 36.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 17.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notes : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Choose variants and weights\nbased on your capabilities.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.pushReplacementNamed(
                          context, '/bulk/workout/push'),
                    },
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const PushWorkoutPage())),
                    child: Container(
                      margin: const EdgeInsets.only(top: 18),
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 176, 0, 1),
                        border: Border.all(
                            color: const Color.fromRGBO(25, 176, 0, 1),
                            width: 3.0),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('assets/push.png')),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Push\nWorkout',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32,
                                  height: 1,
                                ),
                              ),
                              // Transform.translate(
                              //   offset: const Offset(0.0, -10.0),
                              //   child: const Text(
                              //     'Workout',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.w800,
                              //         fontSize: 32),
                              //   ),
                              // ),
                              Text(
                                '(Chest, Shoulder, Tricep)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 9),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.pushReplacementNamed(
                          context, '/bulk/workout/pull'),
                    },
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const PullWorkoutPage())),
                    child: Container(
                      margin: const EdgeInsets.only(top: 18),
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 176, 0, 1),
                        border: Border.all(
                            color: const Color.fromRGBO(25, 176, 0, 1),
                            width: 3.0),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('assets/pull.png')),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pull\nWorkout',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32,
                                  height: 1,
                                ),
                              ),
                              // Transform.translate(
                              //   offset: const Offset(0.0, -10.0),
                              //   child: const Text(
                              //     'Workout',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.w800,
                              //         fontSize: 32),
                              //   ),
                              // ),
                              Text(
                                '(Traps, Lats, Rear Deltoid)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 9),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.pushReplacementNamed(
                          context, '/bulk/workout/leg'),
                    },
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LegWorkoutPage())),
                    child: Container(
                      margin: const EdgeInsets.only(top: 18),
                      width: MediaQuery.of(context).size.width,
                      padding:
                          const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 176, 0, 1),
                        border: Border.all(
                            color: const Color.fromRGBO(25, 176, 0, 1),
                            width: 3.0),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('assets/leg.png')),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Leg\nWorkout',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32,
                                    height: 1),
                              ),
                              // Transform.translate(
                              //   offset: const Offset(0.0, -10.0),
                              //   child: const Text(
                              //     'Workout',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontWeight: FontWeight.w800,
                              //         fontSize: 32),
                              //   ),
                              // )
                              Text(
                                '(Quads, Hamstring, Calf)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 9),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
                        ProgramRecommendation(list: dummyProgram, height: 250),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 4, top: 4),
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
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
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
                                  decoration: TextDecoration.underline,
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
                  )
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
