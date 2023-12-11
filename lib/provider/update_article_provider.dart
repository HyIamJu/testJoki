import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/article_model.dart';
import '../services/all_services.dart';
import '../utils/finite_state.dart';

class UpdateArticleProvider extends ChangeNotifier {
  final service = AllServices();
  MyState state = MyState.loading;

  PageController pageControllerArticle = PageController();
  final TextEditingController headingControler = TextEditingController();
  final TextEditingController link = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  List<Article> articles = [];
  Article? seelctedArticle;
  File? imagefiles;

  void setArticle(List<Article> newArticleList) {
    articles = newArticleList;
    notifyListeners();
  }

  Article getSelectedArticle() {
    if (pageControllerArticle.page == null) {
      seelctedArticle = articles[0];
      return articles[0];
    }
    seelctedArticle = articles[pageControllerArticle.page!.toInt()];
    return articles[pageControllerArticle.page!.toInt()];
  }

  void initial() async {
    var artikel = getSelectedArticle();
    headingControler.text = artikel.title;
    link.text = artikel.url;
    imageController.text = artikel.photo;
  }

  void nextPages() {
    pageControllerArticle.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPages() {
    pageControllerArticle.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Future getImage() async {
  //   XFile image;
  //   final picker = ImagePicker();

  //   var pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     // imageQuality: 50, // <- Reduce Image quality
  //     // maxHeight: 1024, // <- reduce the image size
  //     // maxWidth: 1024,
  //   );

  //   if (pickedFile?.path != null || pickedFile?.path != "") {
  //     image = XFile(pickedFile!.path);
  //     files = image;
  //     imageController.text = pickedFile!.path;
  //   }

  //   // _upload(_image);
  // }

  Future<File> getImageNew() async {
    final ImagePicker _picker = ImagePicker();
// Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//TO convert Xfile into file
    File file = File(image!.path);
//print(‘Image picked’);

    imagefiles = file;
    return file;
  }

  void updateArticles(
      //   {
      ) async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      // var dataArtikel = getSelectedArticle().id;ar
      final response = await service.uploadImage(
          file: imagefiles!,
          detail: link.text,
          idArticle: "${seelctedArticle?.id}",
          title: headingControler.text);
      print('$response');
      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      print('$e');
      state = MyState.failed;
      notifyListeners();
    }
  }
}
