import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/components/AdminTextField.dart';
import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/model/nutrition_model.dart';
import 'package:aplikasi_body_goals/services/nutrition_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNutritionPage extends StatefulWidget {
  const EditNutritionPage({Key? key}) : super(key: key);

  @override
  _EditNutritionPageState createState() => _EditNutritionPageState();
}

class _EditNutritionPageState extends State<EditNutritionPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  // File? _selectedImage;
  final _formKey = GlobalKey<FormState>();

  Future<void> _updateNutrition() async {
    final appState = Provider.of<AppState>(context, listen: false);
    if (!appState.uploadedStatus) {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        // title: response,
        message: 'Image not uploaded',
        duration:const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    } else {
      final nutrition = UpdateNutritionModel(
        id: appState.nutritionId,
        name: _nameController.text,
        link: _linkController.text,
        photo: appState.uploadedImage,
        mime: appState.mimeImage,
      );
      final Map<String, String> response =
          await NutritionService.updateNutrition(nutrition);

      if (response['success'] == 'true') {
        appState.setUploadedStatus(false);
        appState.setUploadedImage(File(''));
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          // title: response,
          message: response['message'],
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);
      } else {
        await Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          // title: response,
          message: response['message'],
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
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
            Padding(
              padding:const EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(
                  route: appState.workout == 'bulk'
                      ? '/bulk/nutrition'
                      : '/cut/nutrition'),
            ),
          const  SizedBox(
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
                    Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 4, top: 4),
                      margin:const EdgeInsets.only(top: 14, bottom: 14),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(25, 176, 0, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Text(
                        'Nutrition: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    const Text(
                      'Suplemen ',
                      style: TextStyle(
                          color: Color.fromRGBO(25, 176, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    AdminTextField(
                      label: "Name",
                      hint: "",
                      isImage: false,
                      controller: _nameController,
                      validatorText: "Please enter your name",
                    ),
                    AdminTextField(
                      label: "Link",
                      hint: "",
                      isImage: false,
                      controller: _linkController,
                      validatorText: "Please enter your link",
                    ),
                    AdminTextField(
                      label: "Image",
                      hint: "",
                      isImage: true,
                      controller: _linkController,
                      validatorText: "Please enter your image",
                    ),
                  const  SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {_updateNutrition()}
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(25, 176, 0, 1),
                          // Background color of the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the radius here
                          ),
                        ),
                        child:const Padding(
                          padding:  EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                          child: Text(
                            "Save",
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black, // Text color
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
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
