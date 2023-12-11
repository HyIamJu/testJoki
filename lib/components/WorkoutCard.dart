import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String desc;
  final String? desc2;
  const WorkoutCard(
      {super.key,
      required this.children,
      required this.title,
      required this.desc,
      this.desc2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            )),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: children,
                ),
                Container(
                  height: 100,
                  width: 80,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                  margin: const EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: const Color.fromRGBO(25, 176, 0, 1), width: 3.0),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        desc,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      if (desc2 != null)
                        const SizedBox(
                          height: 8,
                        ),
                      Text(
                        desc2 ?? '',
                        style: const TextStyle(
                            color: Color.fromRGBO(25, 176, 0, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 12,
        // ),
        // Text(
        //   desc,
        //   style: TextStyle(
        //       color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
        // ),
      ],
    );
  }
}
