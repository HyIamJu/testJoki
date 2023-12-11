// import 'dart:async';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:aplikasi_body_goals/app/helpers.dart';
import 'package:aplikasi_body_goals/model/article_model.dart';
import 'package:aplikasi_body_goals/provider/update_article_provider.dart';
import 'package:aplikasi_body_goals/services/article_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

class CarouselSlider extends StatefulWidget {
  // final PageController pageControl;
  const CarouselSlider({
    super.key,
    // required this.pageControl,
  });

  @override
  State<StatefulWidget> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  late Future<List<Article>> articles;
  @override
  void initState() {
    // _pageController = widget.pageControl;
    super.initState();
    articles = ArticleService.getArticle();
  }

  // final List<String> images = [
  //   'assets/slider_1.png',
  //   'assets/slider_2.png',
  //   'assets/slider_3.png',
  //   'assets/slider_4.png',
  // ];

  int currentIndex = 0;
  // PageController? _pageController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          context.read<UpdateArticleProvider>().articles = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 18,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      HelperApp.urlLaunchers(
                          url: snapshot.data![currentIndex].url);
                    },
                    child: SizedBox(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: context
                            .read<UpdateArticleProvider>()
                            .pageControllerArticle,
                        itemCount: snapshot.data!.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final article = snapshot.data![index];
                          // print(article.);
                          return _buildCarouselItem(
                              article.photo, article.title, article.detail);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        context.read<UpdateArticleProvider>().previousPages();
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        context.read<UpdateArticleProvider>().nextPages();
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 0,
                    right: 0,
                    child: _buildDots(snapshot.data!.length),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          );
        }
      },
    );
  }

  // _launchUrl(urlParam) async {
  //   if (!urlParam.startsWith('http://') && !urlParam.startsWith('https://')) {
  //     // Jika tidak, tambahkan protokol "http://"
  //     urlParam = 'http://$urlParam';
  //   }
  //   final url = Uri.parse(urlParam);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget _buildCarouselItem(String imageUrl, String title, String detail) {
    double aspectRatio = MediaQuery.of(context).size.width / 100;
    return
        //  FutureBuilder<ui.Image>(
        //   future: getImageDimensions(imageUrl),
        //   builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done &&
        //         snapshot.data != null) {
        //
        Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / aspectRatio,
      decoration: const BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage(imageUrl),
        //   fit: BoxFit.contain,
        // ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Stack(
        children: [
          // Image dengan gradient transparan di sebelah kiri
          Container(
            height: MediaQuery.of(context).size.width / aspectRatio,
            constraints: const BoxConstraints(
              maxWidth: 120.0, // Set lebar maksimum
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)
                    .createShader(
                  Rect.fromLTRB(0, 0, bounds.width, 0),
                );
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(imageUrl).image,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          // Teks di sebelah kanan
          Positioned.fill(
            left: 50,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width -
                      150, // Set lebar maksimum
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      detail,
                      style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    //       } else {
    //         // Return a placeholder or loading indicator while waiting for the image info
    //         return Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: 100.0,
    //           color: Colors.grey, // Adjust the color as needed
    //         );
    //       }
    //     },
  }

  Future<ui.Image> getImageDimensions(String imageUrl) async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final Image image = Image.asset(imageUrl);

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          completer.complete(info.image);
        },
      ),
    );

    return completer.future;
  }

  Widget _buildDots(int imagesLength) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imagesLength, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
            color: currentIndex == index ? Colors.black : Colors.transparent,
          ),
        );
      }),
    );
  }
}
