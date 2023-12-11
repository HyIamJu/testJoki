import 'package:another_flushbar/flushbar.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/model/profile_model.dart';
import 'package:aplikasi_body_goals/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;
  late Future<UserProfile> userProfile;
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _goalsWeightController = TextEditingController();
  final Profil profileService = Profil();
  final _formKey = GlobalKey<FormState>();

  void goEdit() {
    setState(() {
      // Update the state inside this function
      isEdit = true;
    });
  }

  void goShow() {
    setState(() {
      // Update the state inside this function
      isEdit = false;
    });
  }

  Future<void> setFormFieldsValues(
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController heightController,
    TextEditingController goalsWeightController,
  ) async {
    UserProfile userData = await Profil.getUserProfile();

    nameController.text = userData.name;
    phoneController.text = userData.phone;
    heightController.text = userData.height;
    goalsWeightController.text = userData.goalsWeight;
  }

  Future<void> _updateProfile() async {
    final updatePayload = UserProfile(
      name: _nameController.text,
      phone: _phoneController.text,
      height: _heightController.text,
      goalsWeight: _goalsWeightController.text,
    );

    // try {
    final Map<String, String> response =
        await profileService.updateProfil(updatePayload);
    // Navigator.pushReplacementNamed(context, '/profile');
    if (response['success'] == 'true') {
      setState(() {
        userProfile = Profil.getUserProfile();
      });
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
      // Navigator.pushReplacementNamed(context, '/dashboard');
    }
    // } catch (e) {
    // }
  }

  @override
  void initState() {
    super.initState();
    userProfile = Profil.getUserProfile();

    setFormFieldsValues(
      _nameController,
      _phoneController,
      _heightController,
      _goalsWeightController,
    );
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
            Visibility(
              visible: isEdit,
              child: Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: goEdit,
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
                      )),
                ),
              ),
            ),
            FutureBuilder<UserProfile>(
                future: userProfile,
                builder: (context, snapshot) {
                  final userProfile = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 28, right: 28, top: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (!isEdit) detailProfile(userProfile, context),
                          if (isEdit) editProfile(context),
                          ElevatedButton(
                            onPressed: () {
                              if (isEdit) {
                                if (_formKey.currentState!.validate()) {
                                  if (isEdit) _updateProfile();
                                  goShow();
                                }
                              } else {
                                goEdit();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(25, 176, 0, 1),
                              // Background color of the button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the radius here
                              ),
                              maximumSize: const Size(300, 40),
                              minimumSize: const Size(250, 40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                isEdit ? 'Finish' : 'Edit Profile',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black, // Text color
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/profile/resetPassword');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const ChangePasswordPage()));
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
                              maximumSize: const Size(300, 40),
                              minimumSize: const Size(250, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                      25, 176, 0, 1), // Text color
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              authService.logout();
                              Navigator.pushReplacementNamed(context, '/login');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const ChangePasswordPage()));
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
                              maximumSize: const Size(300, 40),
                              minimumSize: const Size(250, 40),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                      25, 176, 0, 1), // Text color
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const NavigationBarComponent(),
    );
  }

  Form editProfile(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Name',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(25, 176, 0, 1),
                    filled: true,
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Phone Number',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(25, 176, 0, 1),
                    filled: true,
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Height',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextFormField(
                  controller: _heightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(25, 176, 0, 1),
                    filled: true,
                    hintText: 'Height',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Goals weight',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: TextFormField(
                  controller: _goalsWeightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your goals weight';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: const Color.fromRGBO(25, 176, 0, 1),
                    filled: true,
                    hintText: 'Goals Weight',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(25, 176, 0, 1), width: 1.5),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Column detailProfile(UserProfile? userProfile, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              userProfile?.name ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isEdit,
              child: GestureDetector(
                onTap: () => {},
                child: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(25, 176, 0, 1),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        // const Text(
        //   'E-mail',
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w600,
        //       fontSize: 15),
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const Text(
        //       'asdfghjkl@gmail.com',
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w300,
        //           fontSize: 15),
        //     ),
        //     const SizedBox(width: 8),
        //     Visibility(
        //       visible: isEdit,
        //       child: GestureDetector(
        //         onTap: () => {},
        //         child: const Icon(
        //           Icons.edit,
        //           color: Color.fromRGBO(25, 176, 0, 1),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Phone Number',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              userProfile?.phone ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isEdit,
              child: GestureDetector(
                onTap: () => {},
                child: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(25, 176, 0, 1),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        // const Text(
        //   'Gender',
        //   style: TextStyle(
        //       color: Colors.white,
        //       fontWeight: FontWeight.w600,
        //       fontSize: 15),
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const Text(
        //       'Male',
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w300,
        //           fontSize: 15),
        //     ),
        //     const SizedBox(width: 8),
        //     Visibility(
        //       visible: isEdit,
        //       child: GestureDetector(
        //         onTap: () => {},
        //         child: const Icon(
        //           Icons.edit,
        //           color: Color.fromRGBO(25, 176, 0, 1),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Height',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${userProfile?.height ?? ''}cm',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isEdit,
              child: GestureDetector(
                onTap: () => {},
                child: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(25, 176, 0, 1),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Goals Weight',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${userProfile?.goalsWeight ?? ''}kg',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isEdit,
              child: GestureDetector(
                onTap: () => {},
                child: const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(25, 176, 0, 1),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
