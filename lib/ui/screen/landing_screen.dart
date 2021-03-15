import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_validation/ui/screen/home_screen.dart';
import 'package:flutter_form_validation/ui/screen/login_screen.dart';

class LandingScreen extends StatelessWidget {
  static final routeName = 'landing';

  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('ERROR'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return LoginScreen();
                  } else {
                    return HomeScreen();
                  }
                }

                return Scaffold(
                  body: Center(
                    child: Text('Checking Authentication ...'),
                  ),
                );
              });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: Text('Connecting to the App ...'),
          ),
        );
      },
    );
  }
}
