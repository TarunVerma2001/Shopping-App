import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late String newPassword;
late String confirmNewPassword;

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(left: 15, right: 15),
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
            // SizedBox(height: 85,),
            Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  // color: Color(0xfffdd148),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 2],
                      colors: [Color(0xfffdd148), Colors.white],
                    ),
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
              ],
            ),
            Positioned(
              // top: 50,
              // left: 15,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Change Password',
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New Password',
                              style: GoogleFonts.quicksand(
                                  fontSize: 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              maxLines: 1,
                              onChanged: (value) {
                                newPassword = value;
                                print(value);
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // hintMaxLines: 7,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.black12.withOpacity(0.05),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                hintText: "Ex: ******",
                                hintStyle: GoogleFonts.quicksand(
                                    color: Colors.grey, fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Confirm New Password',
                              style: GoogleFonts.quicksand(
                                  fontSize: 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              maxLines: 1,
                              onChanged: (value) {
                                confirmNewPassword = value;
                                print(value);
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // hintMaxLines: 7,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.black12.withOpacity(0.05),
                                filled: true,
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                hintText: "Ex: ******",
                                hintStyle: GoogleFonts.quicksand(
                                    color: Colors.grey, fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      // infoCard('New Password', "Ex: ******", 1, 50, 0),
                      // infoCard('Confirm New Password', "Ex: ******", 1, 50, 2),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            var user = FirebaseAuth.instance.currentUser;
                            if (newPassword != confirmNewPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Enter same password as new Password"),
                                  elevation: 5.0,
                                  duration: Duration(milliseconds: 700),
                                ),
                              );
                            } else {
                              await user!
                                  .updatePassword(newPassword)
                                  .catchError((err) {
                                print(err);
                                if (err != null) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Enter valid Password"),
                                    elevation: 5.0,
                                    duration: Duration(milliseconds: 600),
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Password Succesfully Changed"),
                                    elevation: 5.0,
                                    duration: Duration(milliseconds: 600),
                                  ));
                                }
                              });
                            }
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   stops: [0.1, 2],
                                //   colors: [Colors.yellow, Colors.orange],
                                // ),
                                color: Colors.amber,
                              ),
                              child: Center(
                                child: Text(
                                  'Change Password',
                                  style: GoogleFonts.quicksand(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(
    String title,
    String hintText,
    int lines,
    double height,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.quicksand(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 30,
        ),
        Container(
          height: height,
          child: TextFormField(
            maxLines: lines,
            onChanged: (value) {
              if (index == 0) {
                setState(() {
                  newPassword = value;
                  print(value);
                });
              } else if (index == 1) {
                setState(() {
                  confirmNewPassword = value;
                  print(value);
                });
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              // hintMaxLines: 7,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              fillColor: Colors.black12.withOpacity(0.05),
              filled: true,
              contentPadding: EdgeInsets.only(left: 15, top: 15),
              hintText: hintText,
              hintStyle:
                  GoogleFonts.quicksand(color: Colors.grey, fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
