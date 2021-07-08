import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/Screens/contact_us_screen.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:furniture_app/stats_page/top_container.dart';
import 'package:furniture_app/stats_page/widgets/ListItemsCard.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  List<Color> colors = [
    Colors.yellow,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  @override
  void initState() {
    super.initState();
    loggedIn();
    controller = new TabController(length: 3, vsync: this);
  }

  loggedIn() {
    userStatus = isLoggedIn();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdd148),
      body: Container(
        // alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 30, top: 60),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Container(
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
                            ? FirebaseAuth.instance.currentUser!.email
                                .toString()[0]
                                .toUpperCase()
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
                      userStatus ? 'Hello!' : 'Hello! Sign In!',
                      style: GoogleFonts.quicksand(
                        fontSize: 35.0,
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
            SizedBox(
              height: 40,
            ),
            userStatus ? GestureDetector(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ContactUsScreen();
              }));
            }, child: card('Support', Icons.phone_outlined)) : Container(),
            userStatus
                ? card('Privacy policy', Icons.lock_outline)
                : Container(),
            userStatus ? card('FAQs', CupertinoIcons.question) : Container(),
            userStatus
                ? card('Order History', Icons.cases_rounded)
                : Container(),
            userStatus
                ? card('Enter Promo Code', Icons.attach_file)
                : Container(),
            userStatus
                ? card('Wallet', CupertinoIcons.creditcard)
                : Container(),
            userStatus ? card('Favorites', CupertinoIcons.star) : Container(),
            userStatus
                ? GestureDetector(
                    onTap: () async{
                      await FirebaseAuth.instance.signOut();
                        setState(() {
                          userStatus = false;
                        });
                    },
                    child: card('Logout', Icons.logout),
                  )
                : Container(),
          ],
        ),
      ),
    );
    // body: MediaQuery.removePadding(
    //   context: context,
    //   removeTop: true,
    //   child: ListView(
    //     children: [
    //       Column(
    //         children: [
    //           StatsTopContainer(),
    //           SizedBox(height: 15.0,),

    //         ],
    //       )
    //     ],
    //   ),
    // ),
    // bottomNavigationBar: Material(elevation: 5.0, child: SizedBox(height: 60, child: BottomNavBar(controller: controller, activated: 0,))),
  }

  Widget card(String name, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: GoogleFonts.quicksand(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
