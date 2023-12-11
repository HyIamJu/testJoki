import 'package:aplikasi_body_goals/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({Key? key}) : super(key: key);

  @override
  _NavigationBarComponentState createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // int _currentIndex = 0;

    // void _navigateToPage(int index) {
    //   setState(() {
    //     _currentIndex = index;
    //   });
    // }

    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(25, 176, 0, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          )),
      child: BottomNavigationBar(
        elevation: 0,
        // currentIndex: _currentIndex,
        onTap: (index) {
          // print(index);
          // setState(() {
          //   if (index == 1 && appState.isbulk == false) {
          //     _currentIndex = 2;
          //   } else {
          //     _currentIndex = index;
          //   }
          // });
          switch (index) {
            case 0:
              appState.setBulkStatus(false);
              Navigator.pushReplacementNamed(context, '/dashboard');
              break;
            case 1:
              if (appState.isbulk == false) {
                appState.setBulkStatus(false);
                Navigator.pushReplacementNamed(context, '/profile');
              } else if (appState.workout == 'bulk') {
                if (appState.pageAfterWorkout == 'body') {
                  Navigator.pushReplacementNamed(context, '/bulk/workout');
                } else if (appState.pageAfterWorkout == 'nutrition') {
                  Navigator.pushReplacementNamed(context, '/bulk/nutrition');
                } else if (appState.pageAfterWorkout == 'trainer') {
                  Navigator.pushReplacementNamed(context, '/bulk/trainer');
                } else if (appState.pageAfterWorkout == 'review') {
                  Navigator.pushReplacementNamed(context, '/bulk/review');
                }
                // appState.setBulkStatus(false);
                // Navigator.pushReplacementNamed(context, '/bulk');
              } else {
                if (appState.pageAfterWorkout == 'body') {
                  Navigator.pushReplacementNamed(context, '/cut/workout');
                } else if (appState.pageAfterWorkout == 'nutrition') {
                  Navigator.pushReplacementNamed(context, '/cut/nutrition');
                } else if (appState.pageAfterWorkout == 'trainer') {
                  Navigator.pushReplacementNamed(context, '/cut/trainer');
                } else if (appState.pageAfterWorkout == 'review') {
                  Navigator.pushReplacementNamed(context, '/cut/review');
                }
                // appState.setBulkStatus(false);
                // Navigator.pushReplacementNamed(context, '/cut');
              }
              break;
            case 2:
              appState.setBulkStatus(false);
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon_home.png'),
            label: 'Home',
          ),
          if (appState.isbulk)
            BottomNavigationBarItem(
              icon: Image.asset('assets/icon_barbell.png'),
              label: 'Bulk',
            ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icon_user.png'), label: 'Profile'),
        ],
      ),
    );
  }
}
