import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/model/trainer_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aplikasi_body_goals/services/trainer_service.dart';
import 'package:flutter/material.dart';

import '../../app/helpers.dart';

class CutTrainerPage extends StatefulWidget {
  const CutTrainerPage({Key? key}) : super(key: key);

  @override
  State<CutTrainerPage> createState() => _CutTrainerPageState();
}

class _CutTrainerPageState extends State<CutTrainerPage> {
  late Future<List<Trainer>> trainers;

  @override
  void initState() {
    super.initState();
    trainers = TrainerService.getTrainer();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    double screenWidthFont = MediaQuery.of(context).size.width;
    double widthContact = screenWidthFont < 400 ? 130 : 150;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36, bottom: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_bulk.png'),
            opacity: 0.6,
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
              padding: const EdgeInsets.only(right: 12, left: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 4, top: 4),
                    margin: const EdgeInsets.only(top: 14, bottom: 14),
                    decoration: const BoxDecoration(
                        // color: Color.fromRGBO(25, 176, 0, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Text(
                      'Consultant &\nContact Trainers ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  FutureBuilder<List<Trainer>>(
                    future: trainers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 30,
                          ),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final review = snapshot.data![index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 28, bottom: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                    child: CachedNetworkImage(
                                      imageUrl: review.photo,
                                      width: 130,
                                      height: 150,
                                      fit: BoxFit.fitHeight,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                        );
                                      },
                                      errorWidget: (context, url, error) =>
                                          const Center(
                                              child: Icon(Icons.error)),
                                    ),
                                  ),
                                  // Image.asset(
                                  //   'assets/trainer1.png',
                                  //   width: 100,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90,
                                        padding: const EdgeInsets.only(
                                            left: 12, bottom: 4, top: 4),
                                        alignment: Alignment.centerLeft,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                            top: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 2.0),
                                            right: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 2.0),
                                          ),
                                        ),
                                        child: Text(
                                          review.name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: widthContact,
                                        padding: const EdgeInsets.only(
                                            left: 12, bottom: 4, top: 4),
                                        alignment: Alignment.centerLeft,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                            top: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 2.0),
                                            right: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 2.0),
                                            bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 2.0),
                                            left: BorderSide(
                                                color: Color.fromRGBO(
                                                    25, 176, 0, 1),
                                                width: 0),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                                15.0), // Sesuaikan dengan radius yang diinginkan
                                          ),
                                        ),
                                        child: Text(
                                          review.phone,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 56.0),
                                      InkWell(
                                        onTap: () {
                                          HelperApp.sendWhatsApp(
                                              phoneNumbers: review.phone,
                                              nametrainer: review.name);
                                        },
                                        child: Container(
                                          width: widthContact,
                                          padding: const EdgeInsets.only(
                                              left: 12, bottom: 4, top: 4),
                                          alignment: Alignment.centerLeft,
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromRGBO(25, 176, 0, 1),
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Wrap(
                                            children: [
                                              const Text(
                                                'Contact Me!',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Image.asset(
                                                'assets/icon_whatsapp.png',
                                                height:
                                                    24, // Adjust the height as needed
                                                width:
                                                    24, // Adjust the width as needed
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Visibility(
                                    visible: appState.isAdmin,
                                    child: InkWell(
                                      onTap: () => {
                                        appState.setTrainerId(review.id),
                                        Navigator.pushReplacementNamed(
                                            context, '/admin/edit/trainer')
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const EditArticlePage()),
                                        // )
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 18.0,
                                            color:
                                                Color.fromRGBO(25, 176, 0, 1),
                                          ),
                                          Text(
                                            'Edit',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(25, 176, 0, 1),
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 4, top: 4),
                    margin: const EdgeInsets.only(top: 14, bottom: 14),
                    decoration: const BoxDecoration(
                        // color: Color.fromRGBO(25, 176, 0, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Text(
                      'Gym',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28, right: 28, bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Find the nearest gym',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            _launchGoogleMaps();
                          },
                          child: const Text(
                            'Here >>',
                            style: TextStyle(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/maps.png'),
                        GestureDetector(
                          onTap: () {
                            _launchGoogleMaps();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 5, right: 5),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: const Text(
                              'or here >> ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
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

  // _launchWhatsapp(String phoneNumber) async {
  //   final String number;
  //   if (phoneNumber.startsWith('0')) {
  //     number = '62${phoneNumber.substring(1)}';
  //   }

  //   final url = Uri.parse('https://wa.me/${phoneNumber}');
  //   // print(phoneNumber);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
