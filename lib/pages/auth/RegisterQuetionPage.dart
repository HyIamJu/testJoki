import 'package:aplikasi_body_goals/model/register_model.dart';
import 'package:aplikasi_body_goals/services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class RegisterQuetionPage extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirm;
  const RegisterQuetionPage({
    Key? key,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirm,
  }) : super(key: key);

  @override
  _RegisterQuetionPageState createState() => _RegisterQuetionPageState();
}

class _RegisterQuetionPageState extends State<RegisterQuetionPage> {
  String selectedValue = 'Male';
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _recentWeightController = TextEditingController();
  final TextEditingController _goalsWeightController = TextEditingController();
  final RegisterService register = RegisterService();
  final _formKey = GlobalKey<FormState>();

  Future<void> _register() async {
    final user = Register(
      username: widget.username,
      name: widget.name,
      email: widget.email,
      phone: widget.phone,
      gender: selectedValue,
      password: widget.password,
      passwordConfirm: widget.passwordConfirm,
      height: _heightController.text,
      recentWeight: _recentWeightController.text,
      goalsWeight: _goalsWeightController.text,
    );

    final Map<String, String> response = await register.register(user);
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
    // try {
    // await register.register(user);
    // Navigator.pushReplacementNamed(context, '/login');
    // } catch (e) {
    //   // Handle kesalahan login
    //   print('Gagal Register: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 36),
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/bg_gym.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 15,
                          )),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Gender',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 28.0, right: 28.0),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        border: Border.all(
                          color: const Color.fromRGBO(
                              25, 176, 0, 1), // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromRGBO(
                              25, 176, 0, 1), // Dropdown icon color
                        ),
                        value: selectedValue,
                        hint: const Text('Choose Gender'),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        isExpanded: true,
                        underline: Container(), // Remove the default underline
                        items: <String>['Male', 'Female']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  color: Color.fromRGBO(25, 176, 0, 1)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Height',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                      child: TextFormField(
                        controller: _heightController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your height';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(25, 176, 0, 1)),
                        decoration: const InputDecoration(
                          hintText: 'Height',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
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
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Recent Weight',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                      child: TextFormField(
                        controller: _recentWeightController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your recent weight';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(25, 176, 0, 1)),
                        decoration: const InputDecoration(
                          hintText: 'Recent Weight',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
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
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 14, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Goals Weight',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 28.0, right: 28.0, bottom: 14),
                      child: TextFormField(
                        controller: _goalsWeightController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your goals weight';
                          }
                          return null;
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(25, 176, 0, 1)),
                        decoration: const InputDecoration(
                          hintText: 'Goals Weight',
                          hintStyle:
                              TextStyle(color: Color.fromRGBO(25, 176, 0, 1)),
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
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _register();
                            } // Navigator.pushReplacementNamed(context, '/dashboard');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(25, 176, 0, 1),
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
                              'Register',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
