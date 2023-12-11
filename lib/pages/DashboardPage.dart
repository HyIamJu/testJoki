import 'package:aplikasi_body_goals/components/CarouselSlider.dart';
import 'package:aplikasi_body_goals/components/LogoTopComponent.dart';
import 'package:aplikasi_body_goals/components/NavigationBarComponent.dart';
import 'package:aplikasi_body_goals/provider/app_provider.dart';
import 'package:aplikasi_body_goals/provider/user_status_provider.dart';
import 'package:aplikasi_body_goals/utils/finite_state.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_body_goals/AppState.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserStatusProvider>().getUserInfo().then((_) {
        if (context.read<UserStatusProvider>().userinfo?.data?.role ==
            "admin") {
          context.read<AppProvider>().setAdminStatus(true);
        } else {
          context.read<AppProvider>().setAdminStatus(false);
        }
      });
    });
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'New Articles :',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Consumer<UserStatusProvider>(
                              builder: (context, snapshot, _) {
                            if (snapshot.state == MyState.loading) {
                              return const SizedBox.shrink();
                            }

                            if (snapshot.state == MyState.loaded) {
                              return Visibility(
                                visible:
                                    snapshot.userinfo?.data?.role == "admin",
                                child: InkWell(
                                  onTap: () => {
                                    Navigator.pushReplacementNamed(
                                        context, '/admin/edit/article',
                                        arguments: _pageController)
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const EditArticlePage()),
                                    // )
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 18.0,
                                        color: Color.fromRGBO(25, 176, 0, 1),
                                      ),
                                      Text(
                                        'Edit',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(25, 176, 0, 1),
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          })
                        ],
                      ),
                      CarouselSlider(),
                      const Text(
                        'Choose Program :',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () => {
                          // appState.setBulkStatus(true),
                          appState.setWorkoutStatus('bulk'),
                          Navigator.pushReplacementNamed(context, '/bulk'),
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 18),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(25, 176, 0, 1),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0)),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: Colors.white,
                                size: 60,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Gain Weight',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          // appState.setBulkStatus(true),
                          appState.setWorkoutStatus('cut'),
                          Navigator.pushReplacementNamed(context, '/cut'),
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 18),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                color: const Color.fromRGBO(25, 176, 0, 1),
                                width: 3.0),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0)),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.trending_down,
                                color: Color.fromRGBO(25, 176, 0, 1),
                                size: 60,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Weight Loss',
                                style: TextStyle(
                                    color: Color.fromRGBO(25, 176, 0, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: const NavigationBarComponent());
  }
}
