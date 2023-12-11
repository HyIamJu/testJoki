import 'package:flutter/material.dart';

class WorkoutButtonCard extends StatefulWidget {
  final String route;
  final String image;
  final String title;
  final String? subtitle;

  const WorkoutButtonCard({
    super.key,
    required this.route,
    required this.image,
    required this.title,
    this.subtitle,
  });

  @override
  State<WorkoutButtonCard> createState() => _WorkoutButtonCardState();
}

class _WorkoutButtonCardState extends State<WorkoutButtonCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushReplacementNamed(context, widget.route),
      },
      //  Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const PushWorkoutPage())),
      child: Container(
        margin: const EdgeInsets.only(top: 18),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(25, 176, 0, 1),
          border: Border.all(
              color: const Color.fromRGBO(25, 176, 0, 1), width: 3.0),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage(widget.image)),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
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
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle!,
                    style:const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 9),
                  ),
                // Text(
                //   '(Chest, Shoulder, Tricep)',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.w800,
                //       fontSize: 9),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
