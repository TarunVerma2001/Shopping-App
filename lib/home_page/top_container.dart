import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/Screens/stats_screen.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';

bool userStatus = false;
var currentUser = FirebaseAuth.instance.currentUser;
class HomeTopContainer extends StatefulWidget {

  @override
  _HomeTopContainerState createState() => _HomeTopContainerState();
}

class _HomeTopContainerState extends State<HomeTopContainer> {
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
    return Stack(
      children: [
        Container(
          height: 250.0,
          width: MediaQuery.of(context).size.width,
          
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              // color: Color(0xfffdd148),
              color: Colors.amber
            ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.0,
                ),
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
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/chris.jpg'),
                      // ),
                    ),
                    child: Center(
                      child: Text(
                        userStatus
                        ? currentUser!.email.toString()[0].toUpperCase()
                        : 'SI'
                        , style: GoogleFonts.quicksand(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120.0,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StatsScreen();
                      }));
                    },
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Hello!',
                style: GoogleFonts.quicksand(
                    fontSize: 35.0, fontWeight: FontWeight.bold),
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
                    fontSize: 23.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffFEDF62),
                      size: 30.0,
                    ),
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.quicksand(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}
