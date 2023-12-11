import 'package:aplikasi_body_goals/components/BackButtonTopComponent.dart';
import 'package:aplikasi_body_goals/model/reset_password.dart';
import 'package:aplikasi_body_goals/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _reset() async {
    final resetPayload = ResetPassword(
      email: _emailController.text,
    );
    final AuthService authService = AuthService();
    final Map<String, String> response =
        await authService.resetPassword(resetPayload);
    if (response['success'] == 'false') {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        // title: response,
        message: response['message'],
        duration: Duration(seconds: 3),
        margin: const EdgeInsets.all(8),
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
      Navigator.pushReplacementNamed(context, '/login');
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
                route: '/login',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Color.fromRGBO(25, 176, 0, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                    Stack(
                      children: [
                        Text(
                          'Body',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.0
                              ..color = Colors.white,
                          ),
                        ),
                        const Text(
                          'Body',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-3.0, -18.0),
                      child: const Text(
                        'Goals!',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 50,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0.0, -18.0),
                      child: const Text(
                        'Get Fit\nFeel Great\nReach Your\nBody Goals',
                        style: TextStyle(
                          color: Color.fromRGBO(25, 176, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 28.0, right: 28.0, bottom: 14),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter your email'
                                    : null,
                                style: const TextStyle(
                                    color: Color.fromRGBO(25, 176, 0, 1)),
                                decoration: InputDecoration(
                                  hintText: 'E-mail/Username/Phone Number',
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(25, 176, 0, 1)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the radius here
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(25, 176, 0, 1),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(25, 176, 0, 1),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _reset();
                                }
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           const resetPasswordPage()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(25, 176, 0,
                                    1), // Background color of the button
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
                                  'Next',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white, // Text color
                                    fontSize: 16.0,
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
            ),
          ],
        ),
      ),
    );
  }
}
