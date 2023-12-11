import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String desc;
  const NutritionCard({
    super.key,
    required this.children,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Carbohydrate',
        style: TextStyle(
            color: Color.fromRGBO(25, 176, 0, 1),
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),
      Padding(
        padding:const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Eat additional fibrous carbs,\nsuch as:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: children,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 28,
      ),
    ]);
  }
}
