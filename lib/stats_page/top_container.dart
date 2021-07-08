import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:furniture_app/stats_page/widgets/Card1.dart';
import 'package:furniture_app/stats_page/widgets/Card2.dart';
import 'package:google_fonts/google_fonts.dart';

bool userStatus = false;
var currentUser = FirebaseAuth.instance.currentUser;

class StatsTopContainer extends StatefulWidget {
  const StatsTopContainer({Key? key}) : super(key: key);

  @override
  _StatsTopContainerState createState() => _StatsTopContainerState();
}

class _StatsTopContainerState extends State<StatsTopContainer> {
  @override
  void initState() {
    super.initState();
    loggedIn();
  }

  loggedIn() {
    userStatus = isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          color: Color(0xfffdd148),
        ),
        Positioned(
          top: -200,
          right: 100,
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: Color(0xfffee16d),
            ),
          ),
        ),
        Positioned(
          top: -150,
          left: 200,
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: Color(0xfffee16d).withOpacity(0.5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0),
                      ),
                      child: Center(
                        child: Text(
                          userStatus
                              ? FirebaseAuth.instance.currentUser!.email.toString()[0].toUpperCase()
                              : 'SI',
                          style: GoogleFonts.quicksand(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userStatus 
                        ? 'Hello!'
                        : 'Hello! Sign In!',
                        style: GoogleFonts.quicksand(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userStatus
                        ? FirebaseAuth.instance.currentUser!.email.toString()
                        : '',
                        style: GoogleFonts.quicksand(
                          fontSize: 15.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 70.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card2(
                    imgPath: 'assets/images/card.png',
                    title: 'Pending payment',
                    valueCount: userStatus ? '5' : '0',
                  ),
                  SizedBox(height: 10.0),
                  Card2(
                    imgPath: 'assets/images/box.png',
                    title: 'To be Shipped',
                    valueCount: userStatus ? '3' : '0',
                  ),
                  SizedBox(height: 10.0),
                  Card2(
                    imgPath: 'assets/images/truck.png',
                    title: 'To be recieved',
                    valueCount: userStatus ? '2' : '0',
                  ),
                  SizedBox(height: 10.0),
                  Card2(
                    imgPath: 'assets/images/returnbox.png',
                    title: 'Return / replace',
                    valueCount: userStatus ? '1' : '0',
                  ),
                  SizedBox(height: 10.0),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
