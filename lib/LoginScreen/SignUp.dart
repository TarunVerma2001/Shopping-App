import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late String _email;
late String _password;


class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 30,),
            ),
          ),
        ),
        Text(
          'Sign Up',
          style: GoogleFonts.quicksand(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
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
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            _email = value;
            print(_email);
          },
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
          height: 40,
        ),
        GestureDetector(
          onTap: () async {
            try {
              UserCredential userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email,
                      password: _password);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'email-already-in-use') {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Container(
                          height: 100,
                          width: 300,
                          child: Text("The account already exists for this email!!!"),
                        ),
                        elevation: 3.0,
                      );
                    },
                  );
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }
            var currentUser = FirebaseAuth.instance.currentUser;
            if(currentUser != null){
              Navigator.push(context, MaterialPageRoute(builder: (context){
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
                  'Sign Up',
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