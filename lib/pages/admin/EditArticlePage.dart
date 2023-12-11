import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/components/AdminTextField.dart';
import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/components/LogoTopComponent.dart';
import 'package:aplikasi_body_goals/model/article_model.dart';
import 'package:aplikasi_body_goals/provider/update_article_provider.dart';
import 'package:aplikasi_body_goals/services/article_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditArticlePage extends StatefulWidget {
  const EditArticlePage({Key? key}) : super(key: key);

  @override
  _EditArticlePageState createState() => _EditArticlePageState();
}

class _EditArticlePageState extends State<EditArticlePage> {
  final _formKey = GlobalKey<FormState>();
  // File? _selectedImage;

  Future<void> _updateArticle() async {
    final appState = Provider.of<AppState>(context, listen: false);

    // final article = UpdateArticleModel(
    //   id: appState.articleId,
    //   title: _titleController.text,
    //   detail: _linkController.text,
    //   // photo: _selectedImage,
    // );
    // await ArticleService.updateArticle(article);
  }

  Article? artikel;
  @override
  void initState() {
    context.read<UpdateArticleProvider>().initial();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final appState link Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_gym_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const LogoTopComponent(),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(route: '/dashboard'),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Article 1 : ',
                      style: TextStyle(
                          color: Color.fromRGBO(25, 176, 0, 1),
                          fontWeight: FontWeight.w600),
                    ),
                    AdminTextField(
                      label: "Heading",
                      hint: "",
                      isImage: false,
                      controller: context
                          .read<UpdateArticleProvider>()
                          .headingControler,
                      validatorText: "Please enter your heading",
                    ),
                    AdminTextField(
                      label: "Link",
                      hint: "",
                      isImage: false,
                      controller: context.read<UpdateArticleProvider>().link,
                      validatorText: "Please enter your link",
                    ),
                    AdminTextField(
                      label: "Image",
                      hint: "",
                      isImage: true,
                      controller:
                          context.read<UpdateArticleProvider>().imageController,
                      validatorText: "Please enter your heading",
                    ),

                    // // -----------------------------------------------------------
                    // const SizedBox(
                    //   height: 18,
                    // ),
                    // const Text(
                    //   'Article 2 : ',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(25, 176, 0, 1),
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // AdminTextField(
                    //   label: "Heading",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // AdminTextField(
                    //   label: "Link",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your link",
                    // ),
                    // AdminTextField(
                    //   label: "Image",
                    //   hint: "",
                    //   isImage: true,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // const SizedBox(
                    //   height: 18,
                    // ),
                    // // -----------------------------------------------------------
                    // const Text(
                    //   'Article 3 : ',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(25, 176, 0, 1),
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // AdminTextField(
                    //   label: "Heading",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // AdminTextField(
                    //   label: "Link",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your link",
                    // ),
                    // AdminTextField(
                    //   label: "Image",
                    //   hint: "",
                    //   isImage: true,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // const SizedBox(
                    //   height: 18,
                    // ),
                    // // -----------------------------------------------------------
                    // const Text(
                    //   'Article 4 : ',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(25, 176, 0, 1),
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // AdminTextField(
                    //   label: "Heading",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // AdminTextField(
                    //   label: "Link",
                    //   hint: "",
                    //   isImage: false,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your link",
                    // ),
                    // AdminTextField(
                    //   label: "Image",
                    //   hint: "",
                    //   isImage: true,
                    //   controller: _titleController,
                    //   validatorText: "Please enter your heading",
                    // ),
                    // const SizedBox(
                    //   height: 18,
                    // ),

                    // -----------------------------------------------------------
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<UpdateArticleProvider>()
                                .updateArticles();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(25, 176, 0, 1),
                          // Background color of the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the radius here
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white, // Text color
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
