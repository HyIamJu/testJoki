import 'package:aplikasi_body_goals/model/login_model.dart';
import 'package:aplikasi_body_goals/AppState.dart';
import 'package:aplikasi_body_goals/pages/DashboardPage.dart';
import 'package:aplikasi_body_goals/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  // bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    try {
      final bool isAuthenticated = await authService.isAuthenticated();

      if (isAuthenticated) {
        // Jika terotentikasi, arahkan kembali ke halaman dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      } else {
        // Handle jika tidak terotentikasi (jika diperlukan)
      }
    } catch (e) {
      // Handle kesalahan pengecekan otentikasi
      // print('Gagal memeriksa otentikasi: $e');
    }
  }

  Future<void> _login() async {
    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    // String keyword = 'message';
    final Map<String, String> response = await authService.login(user);

    if (response['success'] == 'false') {
      await Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        // title: response,
        message: response['message'],
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
      ).show(context);
    } else {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageLogin(context),
    );
  }

  Container _pageLogin(BuildContext context) {
    return Container(
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
                ],
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
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      style:
                          const TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
                      decoration: InputDecoration(
                        hintText: 'Username',
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
                              color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(25, 176, 0, 1), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, right: 28.0, bottom: 14),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      style:
                          const TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                              color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(25, 176, 0, 1), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        // Flushbar(
                        //   flushbarPosition: FlushbarPosition.TOP,
                        //   title: "Hey Ninja",
                        //   message:
                        //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        //   duration: Duration(seconds: 3),
                        // )..show(context);
                        _login();

                        // if (_usernameController.text == "admin") {
                        //   appState.setAdminStatus(true);
                        //   _usernameController.text = 'userdummy1';
                        //   _passwordController.text = 'Bantenku1@';
                        //   _login();
                        // } else {
                        //   appState.setAdminStatus(false);
                        //   _login();
                        // }
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const GetStartPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(
                          25, 176, 0, 1), // Background color of the button
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set the radius here
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white, // Text color
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: GestureDetector(
                        onTap: () => {
                              Navigator.pushReplacementNamed(
                                  context, '/forgotPassword'),
                            },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(25, 176, 0, 1)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Haven't an account? ",
                          style:
                              TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
                        ),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.pushReplacementNamed(
                                      context, '/register'),
                                },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(25, 176, 0, 1)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
