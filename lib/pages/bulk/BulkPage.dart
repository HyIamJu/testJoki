import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/FeatureButton.dart';
import 'package:aplikasi_body_goals/components/LogoTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:flutter/material.dart';

class BulkPage extends StatefulWidget {
  const BulkPage({Key? key}) : super(key: key);

  @override
  _BulkPageState createState() => _BulkPageState();
}

class _BulkPageState extends State<BulkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/bg_bulk.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: const [
            LogoTopComponent(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(route: '/dashboard'),
            ),
            SizedBox(
              height: 28,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feature:',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  FeatureButton(
                    route: '/bulk/workout',
                    image: 'assets/icon_bulk_barbell.png',
                    title: 'Workout\nRoutine',
                  ),
                  FeatureButton(
                    route: '/bulk/nutrition',
                    image: 'assets/icon_bulk_eat.png',
                    title: 'Nutrition',
                  ),
                  FeatureButton(
                    route: '/bulk/trainer',
                    image: 'assets/icon_bulk_question.png',
                    title: 'Ask\nTrainer',
                  ),
                  FeatureButton(
                    route: '/bulk/review',
                    image: 'assets/icon_bulk_review.png',
                    title: 'Review',
                  ),
                  SizedBox(
                    height: 32,
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
