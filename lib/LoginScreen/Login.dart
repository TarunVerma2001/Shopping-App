import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/LoginScreen/SignUp.dart';
import 'package:furniture_app/Screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late String _email;
late String _password;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },
              child: Container(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                ),
              ),
            ),
          ),
          Text(
            'Log In',
            style: GoogleFonts.quicksand(
                fontSize: 40, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Email',
            style: GoogleFonts.quicksand(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _email = value;
              print(_email);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100)),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: 'example: someone@email.com',
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Password',
            style: GoogleFonts.quicksand(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _password = value;
              print(_password);
            },
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100)),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: 'enter password',
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              width: 200,
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Forgot password?',
              style: GoogleFonts.quicksand(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _email, password: _password);
                print(userCredential);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white12,
                        title: Container(
                          height: 100,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("No User Found!!!"),
                              Text("Use Valid Email!")
                            ],
                          ),
                        ),
                        elevation: 3.0,
                      );
                    },
                  );
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Container(
                          height: 100,
                          width: 300,
                          child: Text("Enter Valid Password!"),
                        ),
                        elevation: 3.0,
                      );
                    },
                  );
                  print('Wrong password provided for that user.');
                }
              }
              var currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              }
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
                    'Log In',
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
