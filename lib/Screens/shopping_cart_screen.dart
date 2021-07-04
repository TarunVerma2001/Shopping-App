import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Data/CartItemData.dart';
import 'package:furniture_app/Data/productInformation.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/ShoppingCartPage/ShopCartTopContainer.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

bool userStatus = false;

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // getTotalAmount();
    // countPrice();
    userStatus = isLoggedIn();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // List<int> price = [800, 1200, 900];
  // List<bool> picked = [true, true, true];
  List<List<Map>> names = ProductInformationList().names;
  int totalAmount = 0;

  

  @override
  Widget build(BuildContext context) {
    CardItemdata cardItemData = Provider.of<CardItemdata>(context);
    List<int> ids = cardItemData.data;
    void countPrice() {
      totalAmount = 0;
      for (int index = 0; index < ids.length; index++) {
        for (int i = 0; i < 4; i++) {
          for (int j = 0; j < names[i].length; j++) {
            if (names[i][j].containsValue(ids[index])) {
              totalAmount += int.parse(names[i][j]['price']);
              print(totalAmount);
            }
          }
        }
      }
    }
    countPrice();
    // List<int> ids = [1, 2, 3, 6, 4, 3];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 120,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                ),
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
                    padding: EdgeInsets.only(top: 30.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                Positioned(
                  top: 85.0,
                  left: 15.0,
                  child: Column(
                    children: [
                      Text(
                        'Shopping Cart',
                        style: GoogleFonts.montserrat(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
                  // left: 15,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 370,
                    width: MediaQuery.of(context).size.width,
                    child: Consumer<CardItemdata>(
                      builder: (context, value, child) {
                        return ListView.builder(
                            itemCount: ids.length,
                            itemBuilder: (context, index) {
                              for (int i = 0; i < 4; i++) {
                                for (int j = 0; j < names[i].length; j++) {
                                  if (names[i][j].containsValue(ids[index])) {
                                    // totalAmount += int.parse(names[i][j]['price']);
                                    print(totalAmount);
                                    return ItemCard(
                                      ids[index],
                                        cardItemData,
                                        names[i][j]['name'],
                                        names[i][j]['price'],
                                        names[i][j]['images'][0],
                                        "red");
                                  }
                                }
                              }
                              return Container();
                            });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          userStatus
              ? Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total: \$' + totalAmount.toString(),
                        style: GoogleFonts.quicksand(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if(totalAmount == 0){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("No items in the Cart!"),
                                  elevation: 5.0,
                                  duration: Duration(milliseconds: 600),
                                ),
                              );
                            } else{
                              print(FirebaseAuth.instance.currentUser!.email.toString());
                              print(cardItemData.data);
                              print('hii');
                              CollectionReference users = FirebaseFirestore.instance.collection('Shopped product Ids');
                              Map<String, List> shoppedItemsIds = {
                                // 'emaisk': 'hiiii'
                                FirebaseAuth.instance.currentUser!.email.toString(): cardItemData.data,
                              };
                              users.add(shoppedItemsIds).catchError((err) {
                                print(err);
                              });
                            }
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50.0,
                              width: 150,
                              child: Center(
                                child: Center(
                                  child: Text(
                                    'Pay Now',
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Material(
          elevation: 5.0,
          child: SizedBox(
              height: 60,
              child: BottomNavBar(
                controller: controller,
                activated: 1,
              ))),
    );
  }

  Widget ItemCard(int id, CardItemdata cardItemData, String itemName, String price,
      String imgPath, String color) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 3.0,
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 10.0),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Container(
                height: 150.0,
                width: 125.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.contain),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemName,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Text(
                        '\$' + price,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Color(0xFFFDD34A)),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            cardItemData.removeId(id);
                          });
                        },
                        child: Material(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(12)),
                          elevation: 3.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFDD34A),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(12)),
                            ),
                            height: 40,
                            width: 100,
                            child: Center(
                              child: Text(
                                'Remove',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
