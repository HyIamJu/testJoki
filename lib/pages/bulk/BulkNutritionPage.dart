import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/components/NutritionCard.dart';
import 'package:aplikasi_body_goals/model/nutrition_model.dart';
import 'package:aplikasi_body_goals/services/nutrition_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/helpers.dart';

class BulkNutritionPage extends StatefulWidget {
  const BulkNutritionPage({Key? key}) : super(key: key);

  @override
  State<BulkNutritionPage> createState() => _BulkNutritionPageState();
}

class _BulkNutritionPageState extends State<BulkNutritionPage> {
  late Future<List<Nutrition>> nutritions;

  @override
  void initState() {
    super.initState();
    nutritions = NutritionService.getNutritionBulk();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36, bottom: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/bg_eat.png'),
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
                      'Nutrition',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 17.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tips:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '1. Eat more often\n2. Make sure your intake is high in nutrients',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  NutritionCard(
                    title: 'Carbohydrate',
                    desc: 'Eat additional fibrous carbs,\nsuch as:',
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/ubi.png'),
                          const Text(
                            'Potato',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/singkong.png'),
                          const Text(
                            'Cassava',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/nasi_merah.png'),
                          const Text(
                            'Brown Rice',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/wheat.png'),
                          const Text(
                            'Whole Wheat',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/sayur.png'),
                          const Text(
                            'Vegetable',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                  NutritionCard(
                    title: 'Protein',
                    desc: 'Consume more protein\nlike :',
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/daging.png'),
                          const Text(
                            'Meat',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/telur.png'),
                          const Text(
                            'Egg',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/tempe.png'),
                          const Text(
                            'Tempe',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/almond.png'),
                          const Text(
                            'Almond',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  NutritionCard(
                    title: 'Fat',
                    desc:
                        'Natural fats are the best kind.\nThis fat is derived from protein sources such as:',
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/daging.png'),
                          const Text(
                            'Meat',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    'Additional Supplements : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 15.0, horizontal: 17.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         '1. Creatine ',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(left: 8.0),
                  //         child: Text(
                  //           'The protein creatine gives muscles their\nentire energy, enabling them to\nYour body gets fatigued less easily\nas you gain strength.\nIt is advised to take it prior to training.',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           SizedBox(width: 10),
                  //           Image.asset(
                  //             'assets/creatine.png',
                  //             width: 100,
                  //             height: 100,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Container(
                  //                 width: 100,
                  //                 padding: const EdgeInsets.only(
                  //                     left: 12, right: 12, bottom: 4, top: 4),
                  //                 decoration: const BoxDecoration(
                  //                     color: Color.fromRGBO(25, 176, 0, 1),
                  //                     borderRadius: BorderRadius.only(
                  //                         bottomRight: Radius.circular(10))),
                  //                 child: const Text(
                  //                   'Purchase Link',
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 13),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 height: 28,
                  //               ),
                  //               Container(
                  //                 width: 100,
                  //                 padding: const EdgeInsets.only(
                  //                     left: 12, right: 12, bottom: 4, top: 4),
                  //                 alignment: Alignment.centerLeft,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.transparent,
                  //                   border: Border.all(
                  //                       color:
                  //                           const Color.fromRGBO(25, 176, 0, 1),
                  //                       width: 2.0),
                  //                 ),
                  //                 child: Text(
                  //                   'Crevolene',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 10,
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 15.0, horizontal: 17.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         '2. Mass Gainer ',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(left: 8.0),
                  //         child: Text(
                  //           'Mass Gainer has a protein composition,\ncarbohydrates and high calories.',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           SizedBox(width: 10),
                  //           Image.asset(
                  //             'assets/mass_gainer.png',
                  //             height: 100,
                  //             width: 100,
                  //             fit: BoxFit.cover,
                  //           ),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Container(
                  //                 width: 100,
                  //                 padding: const EdgeInsets.only(
                  //                     left: 12, right: 12, bottom: 4, top: 4),
                  //                 decoration: const BoxDecoration(
                  //                     color: Color.fromRGBO(25, 176, 0, 1),
                  //                     borderRadius: BorderRadius.only(
                  //                         bottomRight: Radius.circular(10))),
                  //                 child: const Text(
                  //                   'Purchase Link',
                  //                   style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontWeight: FontWeight.w600,
                  //                       fontSize: 13),
                  //                 ),
                  //               ),
                  //               const SizedBox(
                  //                 height: 28,
                  //               ),
                  //               Container(
                  //                 width: 100,
                  //                 padding: const EdgeInsets.only(
                  //                     left: 12, right: 12, bottom: 4, top: 4),
                  //                 alignment: Alignment.centerLeft,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.transparent,
                  //                   border: Border.all(
                  //                       color:
                  //                           const Color.fromRGBO(25, 176, 0, 1),
                  //                       width: 2.0),
                  //                 ),
                  //                 child: Text(
                  //                   'EvoMass',
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 10,
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  FutureBuilder<List<Nutrition>>(
                    future: nutritions,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final nutrition = snapshot.data![index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 17.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${index + 1}. ${nutrition.name}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 8.0),
                                      //   child: Text(
                                      //     'Mass Gainer has a protein composition,\ncarbohydrates and high calories.',
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 12,
                                      //         fontWeight: FontWeight.w600),
                                      //   ),
                                      // ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          const SizedBox(width: 10),
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15)),
                                            child: CachedNetworkImage(
                                              imageUrl: nutrition.photo,
                                              width: 130,
                                              height: 150,
                                              fit: BoxFit.fitHeight,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                      downloadProgress) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                );
                                              },
                                              errorWidget: (context, url,
                                                      error) =>
                                                  const Center(
                                                      child: Icon(Icons.error)),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  HelperApp.urlLaunchers(
                                                      url: nutrition.link);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          bottom: 4,
                                                          top: 4),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          25, 176, 0, 1),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  child: const Text(
                                                    'Purchase Link',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 70,
                                              ),
                                              Container(
                                                width: 100,
                                                padding: const EdgeInsets.only(
                                                    left: 12,
                                                    right: 12,
                                                    bottom: 4,
                                                    top: 4),
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
                                                      width: 2.0,
                                                    ),
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          25, 176, 0, 1),
                                                      width: 2.0,
                                                    ),
                                                    left: BorderSide(
                                                      color: Color.fromRGBO(
                                                          25, 176, 0, 1),
                                                      width: 0,
                                                    ),
                                                  ),
                                                ),
                                                child: AutoSizeText(
                                                  nutrition.name,
                                                  maxFontSize: 14,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Visibility(
                                    visible: appState.isAdmin,
                                    child: InkWell(
                                      onTap: () => {
                                        appState.setNutritionId(nutrition.id),
                                        Navigator.pushReplacementNamed(
                                            context, '/admin/edit/nutrition')
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
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
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
