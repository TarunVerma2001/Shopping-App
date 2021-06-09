import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/twitter.png'),
                              fit: BoxFit.scaleDown)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/google.png'),
                              fit: BoxFit.scaleDown)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/instagram.png'),
                              fit: BoxFit.scaleDown)),
                    ),
                  ],
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
                        'No Registered Account yet? ',
                        style: GoogleFonts.quicksand(
                            fontSize: 13, color: Colors.grey),
                      ),
                      Text(
                        'Sign Up',
                        style: GoogleFonts.quicksand(
                            fontSize: 13, color: Colors.orange),
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
              child: LoginForm(),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget LoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
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
            'Username',
            style: GoogleFonts.quicksand(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100)),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: 'example: xyz12345',
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
          Center(
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
        ],
      ),
    );
  }
}
