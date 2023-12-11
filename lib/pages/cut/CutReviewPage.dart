import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/model/review_model.dart';
import 'package:aplikasi_body_goals/services/review_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CutReviewPage extends StatefulWidget {
  const CutReviewPage({Key? key}) : super(key: key);

  @override
  State<CutReviewPage> createState() => _CutReviewPageState();
}

class _CutReviewPageState extends State<CutReviewPage> {
  late Future<List<Review>> reviews;
  String _rating = '5';
  final TextEditingController _commentController = TextEditingController();
  final ReviewService reviewService = ReviewService();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    reviews = ReviewService.getReview();
  }

  Future<void> _createReview() async {
    final reviewPayload = AddReview(
      comment: _commentController.text,
      rating: _rating,
    );

    try {
      await reviewService.storeReview(reviewPayload);
      Navigator.pushReplacementNamed(context, '/bulk/review');
    } catch (e) {
      // print('Gagal login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36, bottom: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/bg_bulk.png'),
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
                      'Review',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  FutureBuilder<List<Review>>(
                    future: reviews,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 55),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final review = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 28, right: 28, bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: List.generate(
                                      review.rating,
                                      (index) => const Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(25, 176, 0, 1),
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 12,
                                        top: 10,
                                        bottom: 10),
                                    margin: const EdgeInsets.only(
                                        top: 4, bottom: 14),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                25, 176, 0, 1))),
                                    child: Text(
                                      review.comment,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                  // Icon(Icons.message,color: Colors.white,)
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, bottom: 14, top: 14),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar(
                            wrapAlignment: WrapAlignment.start,
                            initialRating: 0, // set the initial rating
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 35.0, // set the size of each star
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Color.fromRGBO(25, 176, 0, 1),
                                size: 25,
                              ),
                              half: const Icon(
                                Icons.star_half,
                                color: Color.fromRGBO(25, 176, 0, 1),
                                size: 25,
                              ),
                              empty: const Icon(
                                Icons.star_border,
                                color: Color.fromRGBO(25, 176, 0, 1),
                                size: 25,
                              ),
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                _rating = rating.toString();
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: _commentController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your review';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Type your review here..',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.5)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(25, 176, 0, 1),
                                    width: 1.5),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(25, 176, 0, 1),
                                    width: 1.5),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(25, 176, 0, 1),
                                    width: 1.5),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(25, 176, 0,
                                  1), // Background color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the radius here
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _createReview();
                              }
                            },
                            child: const Text('Save',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
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
}
