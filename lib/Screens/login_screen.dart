import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/LoginScreen/Login.dart';
import 'package:furniture_app/LoginScreen/SignUp.dart';
import 'package:furniture_app/home_page/top_container.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool formType = true;
  String text1t = 'No Registered Account yet? ';
  String text1f = 'Have Registered Account? ';
  String text2t = 'Sign Up';
  String text2f = 'Log In';
  bool userStatus = false;
  //? data of Forms

  // String usernameL;
  @override
  void initState() {
    super.initState();
    loggedIn();
    print(userStatus);
  }

  loggedIn() {
    userStatus = isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/deskSetup5.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 1],
                  colors: [Colors.white, Colors.transparent],
                ),
              ),
              child: userStatus
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        // print('hii');
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 100),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/google.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 2.5 / 16),
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width * 5.5 / 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 22.0),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userStatus
                            ? "You are Signed In!"
                            : formType
                                ? text1t
                                : text1f,
                        style: GoogleFonts.quicksand(
                            fontSize: 14, color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            formType = !formType;
                          });
                        },
                        child: Text(
                          userStatus
                              ? ""
                              : formType
                                  ? text2t
                                  : text2f,
                          style: GoogleFonts.quicksand(
                              fontSize: 16, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 1.5 / 16),
              height: MediaQuery.of(context).size.height * 0.72,
              width: MediaQuery.of(context).size.width * 6.5 / 8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ]),
              child: userStatus
                  ? GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        setState(() {
                          userStatus = false;
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.1, 2],
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    )
                  : formType
                      ? LoginForm()
                      : SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}
