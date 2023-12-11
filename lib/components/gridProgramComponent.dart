import 'package:flutter/material.dart';

class ProgramRecommendation extends StatelessWidget {
  final List list;
  final double height;
  const ProgramRecommendation({
    super.key,
    required this.list,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidthFont = MediaQuery.of(context).size.width;
    double fontSize = screenWidthFont < 400 ? 12.0 : 14.0;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Program\nRecommendation : ',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Container(
            height: height,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Jumlah kolom dalam grid
                crossAxisSpacing: 8.0, // Spasi antar kolom
                mainAxisSpacing: 8.0, // Spasi antar baris
              ),
              itemCount: list.length, // Jumlah item dalam grid
              itemBuilder: (context, index) {
                if (list[index].status == 'white') {
                  return Container(
                    // width: 120,
                    // margin: const EdgeInsets.only(top: 18, bottom: 18),
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 20.0, left: 8.0, right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: const Color.fromRGBO(25, 176, 0, 1),
                          width: 3.0),
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
                          'Day ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          list[index].text!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        ),
                      ],
                    ),
                  );
                } else if (list[index].status == 'green') {
                  return Container(
                    // width: 120,
                    // margin: const EdgeInsets.only(top: 18, bottom: 18),
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      bottom: 20.0,
                      left: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: const Color.fromRGBO(25, 176, 0, 1),
                          width: 3.0),
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
                          'Day ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          list[index].text!,
                          style: TextStyle(
                              color: const Color.fromRGBO(25, 176, 0, 1),
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    // margin: const EdgeInsets.only(top: 18, bottom: 18),
                    // padding: const EdgeInsets.only(
                    //     top: 15.0,
                    //     bottom: 20.0,
                    //     left: 8.0,
                    //     right: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: const Color.fromRGBO(25, 176, 0, 1),
                          width: 3.0),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Transform.rotate(
                            angle: 2.4,
                            child: const Icon(
                              Icons.sync,
                              color:
                                  Color.fromRGBO(25, 176, 0, 1), // Warna icon
                              size: 78.0, // Ukuran icon
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 40,
                          child: Text(
                            'Repeat',
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 16.0, // Ukuran teks
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
