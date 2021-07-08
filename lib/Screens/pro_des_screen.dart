import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Data/CartItemData.dart';
import 'package:furniture_app/Product%20Description/TopImageCorousel.dart';
import 'package:furniture_app/Screens/shopping_cart_screen.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

bool userStatus = false;

class ProDesScreen extends StatefulWidget {
  List<String> photos;
  String title;
  String price;
  int id;
  ProDesScreen(
      {required this.photos,
      required this.price,
      required this.title,
      required this.id});

  @override
  _ProDesScreenState createState() => _ProDesScreenState();
}

class _ProDesScreenState extends State<ProDesScreen> {
  loggedIn() {
    userStatus = isLoggedIn();
  }

  @override
  void initState() {
    loggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardItemdata cardItemData = Provider.of<CardItemdata>(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopImageCorousel(
                photos: widget.photos,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  '\$ ' + widget.price,
                  style: GoogleFonts.montserrat(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  // width: MediaQuery.of(context).size.width - 30,
                  child: Text(
                    'Best Laptop For Productivity. Consisting of High performance and No lack in quality and Durablity.',
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'COLOR',
                  style: GoogleFonts.montserrat(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xff5A5551),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffC3BCB5),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffC3BCB5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 7.0,
        color: Colors.white,
        child: Container(
          height: 70.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShoppingCartScreen();
                  }));
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (userStatus) {
                    if (cardItemData.data.contains(widget.id)) {
                      setState(() {
                        cardItemData.removeId(widget.id);
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
                        cardItemData.addId(widget.id);
                        cardItemData.toggleAdded(widget.id);
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
                child: Container(
                  color: Color(0xfffedd59),
                  width: MediaQuery.of(context).size.width - 140,
                  child: Center(
                    child: Text(
                      cardItemData.data.contains(widget.id)
                          ? cardItemData
                                  .added[cardItemData.data.indexOf(widget.id)]
                              ? 'Remove'
                              : 'Add to Cart'
                          : 'Add to Cart',
                      style: GoogleFonts.montserrat(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
