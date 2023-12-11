import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/model/profile_model.dart';
import 'package:aplikasi_body_goals/services/profile_service.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _recentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final Profil profileService = Profil();
  final _formKey = GlobalKey<FormState>();

  Future<void> _updatePassword() async {
    final passwordPayload = UserPassword(
      password: _newPasswordController.text,
      passwordConfirm: _confirmNewPasswordController.text,
    );

    try {
      await profileService.updatePassword(passwordPayload);
      Navigator.pushReplacementNamed(context, '/profile');
    } catch (e) {
      // print('Gagal login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_app.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(top: 28, bottom: 28),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: BackButtonTopComponent(
                route: '/profile',
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Recent\nPassword',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter recent password';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: _recentPasswordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(25, 176, 0, 1),
                          filled: true,
                          hintText: 'Recent Password',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'New\nPassword',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _newPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter new password';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(25, 176, 0, 1),
                          filled: true,
                          hintText: 'New Password',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Confirm\nNew Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                    child: SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: _confirmNewPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm new password';
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(25, 176, 0, 1),
                          filled: true,
                          hintText: 'Confirm New Password',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, right: 28.0, top: 20, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _updatePassword();
                            } // Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            // Background color of the button
                            side: const BorderSide(
                                color: Color.fromRGBO(25, 176, 0, 1)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Set the radius here
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                            child: Text(
                              'Finish',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color:
                                    Color.fromRGBO(25, 176, 0, 1), // Text color
                                fontSize: 16.0,
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
