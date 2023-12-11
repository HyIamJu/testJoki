import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/components/AdminTextField.dart';
import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/model/trainer_model.dart';
import 'package:aplikasi_body_goals/services/trainer_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTrainerPage extends StatefulWidget {
  const EditTrainerPage({Key? key}) : super(key: key);

  @override
  _EditTrainerPageState createState() => _EditTrainerPageState();
}

class _EditTrainerPageState extends State<EditTrainerPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();

  Future<void> _updateTrainer() async {
    final appState = Provider.of<AppState>(context, listen: false);
    if (!appState.uploadedStatus) {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        // title: response,
        message: 'Image not uploaded',
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    } else {
      // print(appState.uploadedImage);
      final trainer = UpdateTrainerModel(
        id: appState.trainerId,
        name: _nameController.text,
        phone: _phoneController.text,
        photo: appState.uploadedImage,
        mime: appState.mimeImage,
      );
      final Map<String, String> response =
          await TrainerService.updateTrainer(trainer);

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
              padding: const EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(
                  route: appState.workout == 'bulk'
                      ? '/bulk/trainer'
                      : '/cut/trainer'),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 4, top: 4),
                    margin: const EdgeInsets.only(top: 14, bottom: 14),
                    decoration: const BoxDecoration(
                        // color: Color.fromRGBO(25, 176, 0, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: const Text(
                      'Consultant &\nContact Trainers ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AdminTextField(
                          label: "Nama Trainer",
                          hint: "",
                          isImage: false,
                          controller: _nameController,
                          validatorText: "Please enter your name",
                        ),
                        AdminTextField(
                          label: "Number Phone",
                          hint: "",
                          isImage: false,
                          controller: _phoneController,
                          validatorText: "Please enter your phone number",
                        ),
                        AdminTextField(
                          label: "Image",
                          hint: "",
                          isImage: true,
                          controller: _nameController,
                          validatorText: "Please enter your image",
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {_updateTrainer()}
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(25, 176, 0, 1),
                              // Background color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the radius here
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                "Save",
                                style: TextStyle(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
