import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furniture_app/Data/CartItemData.dart';
import 'package:furniture_app/Data/productInformation.dart';
import 'package:furniture_app/Screens/pro_des_screen.dart';
import 'package:furniture_app/services/crud.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

CrudMethods crudObj = new CrudMethods();
QuerySnapshot data = crudObj.getData();
bool userStatus = false;

class HomeCatRibbon extends StatefulWidget {
  @override
  _HomeCatRibbonState createState() => _HomeCatRibbonState();
}

class _HomeCatRibbonState extends State<HomeCatRibbon> {
  List<bool> active = [true, false, false, false];
  List<List<Map>> names = ProductInformationList().names;

  loggedIn() {
    userStatus = isLoggedIn();
  }

  toggleActive(int index) {
    for (int i = 0; i < 4; i++) {
      active[i] = false;
    }
    active[index] = true;
  }

  Widget currentSelected() {
    for (int i = 0; i < 4; i++) {
      if (active[i]) {
        // return cols[i];
        return ListView.builder(
            itemCount: names[i].length,
            itemBuilder: (BuildContext context, int index) {
              return itemCard(
                  context,
                  names[i][index]['name'],
                  names[i][index]['images'][0],
                  names[i][index]['images'],
                  names[i][index]['price'],
                  names[i][index]['id']);
            });
      }
    }
    return ListView.builder(
        itemCount: names[0].length,
        itemBuilder: (BuildContext context, int index) {
          return itemCard(
              context,
              names[0][index]['name'],
              names[0][index]['images'][0],
              names[0][index]['images'],
              names[0][index]['price'],
              names[0][index]['id']);
        });
  }

  @override
  void initState() {
    loggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          // color: Colors.yellowAccent,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Material(
                elevation: 2.0,
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: active[0] ? 0.0 : 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggleActive(0);
                                });
                              },
                              child: Card('assets/icons/laptop.png', 'Laptop',
                                  active[0]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: active[1] ? 0.0 : 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    toggleActive(1);
                                  });
                                },
                                child: Card('assets/icons/monitor.png',
                                    'Monitor', active[1])),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: active[2] ? 0.0 : 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    toggleActive(2);
                                  });
                                },
                                child: Card('assets/icons/keyboard1.png',
                                    'KeyBoard', active[2])),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              height: active[3] ? 0.0 : 10.0,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    toggleActive(3);
                                  });
                                },
                                child: Card('assets/icons/mouse.png', 'Mouse',
                                    active[3])),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.yellowAccent,
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: currentSelected(),
        ),
      ],
    );
  }

  //* ITEM CARD

  Widget itemCard(BuildContext context, String title, String imgpath,
      List<String> photos, String price, int id) {
    String itemStatus = 'Add to Cart';
    double elevation = 10;
    Color color = Color(0xffF9C335);
    CardItemdata cardItemData = Provider.of<CardItemdata>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProDesScreen(
            price: price,
            title: title,
            photos: photos,
          );
        }));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 7),
              ),
            ],
            color: Colors.white,
          ),
          height: 180,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imgpath),
                  fit: BoxFit.contain,
                )),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.quicksand(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 175,
                        child: Text(
                          'Best Laptop For Productivity. Consisting of High performance and No lack in quality and Durablity.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.quicksand(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(width: 35.0),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xffFEDD59),
                        ),
                        height: 40.0,
                        width: 60.0,
                        child: Center(
                          child: Text(
                            '\$ ' + price,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (userStatus) {
                            if (cardItemData.data.contains(id)) {
                              
                              setState(() {
                                cardItemData.removeId(id);
                                itemStatus = 'Add to Card';
                                color = Color(0xffF9C335);
                                elevation = 6;
                              });
                              print(cardItemData.data);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Succesfully Removed!"),
                                  elevation: 5.0,
                                  duration: Duration(milliseconds: 600),
                                ),
                              );
                            } else {
                              setState(() {
                                cardItemData.addId(id);
                                itemStatus = 'Added';
                                color = Color(0xffFEDD59);
                                elevation = 0;
                              });
                              print(cardItemData.data);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Succesfully Added!"),
                                  elevation: 5.0,
                                  duration: Duration(milliseconds: 600),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("You need to Sign In!"),
                                elevation: 5.0,
                                duration: Duration(milliseconds: 600),
                              ),
                            );
                          }
                        },
                        child: Material(
                          elevation: 6.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xffF9C335),
                            ),
                            height: 40.0,
                            width: 110.0,
                            child: Center(
                              child: Text(
                                itemStatus,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //*CARD

  Widget Card(String imgPath, String title, bool active) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: active ? 5.0 : 0.0,
        child: AnimatedContainer(
          curve: Curves.easeInOutCirc,
          duration: Duration(milliseconds: 400),
          height: active ? 110 : 100,
          decoration: BoxDecoration(
            color: active ? Color(0xfffccd42) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width / 4 - 10,
          child: Center(
            child: Container(
              height: 75,
              // color: Colors.red,
              width: MediaQuery.of(context).size.width / 4,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imgPath),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: GoogleFonts.quicksand(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
