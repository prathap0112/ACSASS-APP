import 'package:acsass_app/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../reusable_widget/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.teal[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoWidget("assets/images/acsass.png"),
              Text(
                "Welcome to ACSASS",
                style: TextStyle(
                  color: Color(0xFFF6D743),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    ),
              ),
              SizedBox(height: 10),
              Text(
                "You have successfully logged in!",
                style: TextStyle(
                  color: Color(0xFFF6D743),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.fromLTRB(80, 10, 80, 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(90)),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SigninScreen()));
                    });
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                ),
              ),
              // ElevatedButton(
              //   child: Text("Logout"),
              //   onPressed: () {
              //     FirebaseAuth.instance.signOut().then((value) {
              //       print("Signed Out");
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => SigninScreen()));
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
