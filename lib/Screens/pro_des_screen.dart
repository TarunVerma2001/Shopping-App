import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Product%20Description/TopImageCorousel.dart';
import 'package:google_fonts/google_fonts.dart';

class ProDesScreen extends StatefulWidget {
  List<String> photos;
  String title;
  String price;
  ProDesScreen({required this.photos, required this.price, required this.title});

  @override
  _ProDesScreenState createState() => _ProDesScreenState();
}

class _ProDesScreenState extends State<ProDesScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopImageCorousel(photos: widget.photos,),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  'Alcide Number: 2323x',
                  style: GoogleFonts.montserrat(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
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
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 4 +
                              MediaQuery.of(context).size.width / 2) -
                          50.0,
                      child: Text(
                        'Scandinavian small size double sofa / imported full leather /Dale Italia oil wax leather black',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      '\$ ' + widget.price,
                      style: GoogleFonts.montserrat(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
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
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'MATERIAL',
                  style: GoogleFonts.montserrat(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                        Icons.time_to_leave,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      'x30%',
                      style: GoogleFonts.montserrat(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                        Icons.timer,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      'x60%',
                      style: GoogleFonts.montserrat(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Icon(
                        Icons.monetization_on,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ),
                    Text(
                      'x10%',
                      style: GoogleFonts.montserrat(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              )
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
                onTap: (){},
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
              InkWell(
                onTap: (){},
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  child: Icon(
                    Icons.account_box,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                color: Color(0xfffedd59),
                width: MediaQuery.of(context).size.width - 140,
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.montserrat(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
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

