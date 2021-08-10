import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/Screens/pro_des_screen.dart';
import 'package:furniture_app/Screens/stats_screen.dart';
import 'package:furniture_app/home_page/catagories_ribbon.dart';
import 'package:furniture_app/home_page/top_container.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';

bool userStatus = false;
var currentUser = FirebaseAuth.instance.currentUser;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController controller;
  late AnimationController controller1;
  @override
  void initState() {
    super.initState();
    loggedIn();
    controller1 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 600));
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

  bool sideSlider = false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: [
          StatsScreen(),
          AnimatedContainer(
            // margin: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey,
              ),
            ]),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            duration: Duration(milliseconds: 600),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              // backgroundColor: Colors.yellowAccent,
              body: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                height: 250.0,
                                width: MediaQuery.of(context).size.width,
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
                                    color: Color(0xfffee16d).withOpacity(0.5),
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
                                    color: Color(0xfffee16d),
                                  ),
                                ),
                              ),
                              // Positioned(
                                
                              //   top: 250.0,
                              //   child: Container(
                              //     // height: MediaQuery.of(context).size.height,
                              //     width: MediaQuery.of(context).size.width,
                              //     child: HomeCatRibbon(),
                              //   ),
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          iconSize: 40,
                                          color: Colors.white,
                                          onPressed: () {
                                            sideSlider
                                                ? setState(() {
                                                    controller1.reverse();
                                                    sideSlider = false;
                                                    xOffset = 0;
                                                    yOffset = 0;
                                                    scaleFactor = 1;
                                                  })
                                                : setState(
                                                    () {
                                                      controller1.forward();
                                                      sideSlider = true;
                                                      xOffset = MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height -
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.62;
                                                      yOffset = MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width -
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7;
                                                      scaleFactor = 0.7;
                                                    },
                                                  );
                                          },
                                          icon: AnimatedIcon(
                                            icon: AnimatedIcons.menu_close,
                                            progress: controller1,
                                            // color: Colors.white,
                                            // iconSize: 30.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width -
                                            140.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return LoginScreen();
                                          }));
                                        },
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 2.0),
                                            // image: DecorationImage(
                                            //   image: AssetImage('assets/images/chris.jpg'),
                                            // ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              userStatus
                                                  ? FirebaseAuth
                                                      .instance.currentUser!.email
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
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Hello!',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'What do you want to buy?',
                                      style: GoogleFonts.quicksand(
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              // Positioned(
                                
                              //   top: 250.0,
                              //   child: Container(
                              //     // height: MediaQuery.of(context).size.height,
                              //     width: MediaQuery.of(context).size.width,
                              //     child: HomeCatRibbon(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        HomeCatRibbon(),
                      ],
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Material(
                elevation: 5.0,
                child: SizedBox(
                    height: 60,
                    child: BottomNavBar(
                      controller: controller,
                      activated: 0,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
