import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furniture_app/Screens/pro_des_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCatRibbon extends StatefulWidget {
  @override
  _HomeCatRibbonState createState() => _HomeCatRibbonState();
}

class _HomeCatRibbonState extends State<HomeCatRibbon> {
  List<bool> active = [true, false, false, false];
  List<List<List<String>>> ls = [
    [
      [
        'assets/images/macbookPro.jpeg',
        'assets/images/macbookPro1.jpeg',
        'assets/images/macbookPro2.jpeg',
      ],
      [
        'assets/images/rog1.jpeg',
        'assets/images/rog2.jpeg',
        'assets/images/rog3.jpeg',
        'assets/images/rog4.jpeg',
      ],
      [
        'assets/images/dell1.jpg',
        'assets/images/dell2.jpg',
        'assets/images/dell3.jpg',
        'assets/images/dell4.jpg',
      ]
    ],
    [
      [
        'assets/images/LG1.jpg',
        'assets/images/LG2.jpg',
        'assets/images/LG3.jpg',
      ],
      [
        'assets/images/benq1.jpg',
        'assets/images/benq2.jpg',
        'assets/images/benq3.jpg',
        'assets/images/benq4.jpg',
      ],
      [
        'assets/images/lenovoThinkvision1.jpg',
        'assets/images/lenovoThinkvision2.jpg',
        'assets/images/lenovoThinkvision3.jpg',
        'assets/images/lenovoThinkvision4.jpg',
      ]
    ],
    [
      [
        'assets/images/macbookPro.jpeg',
        'assets/images/macbookPro1.jpeg',
        'assets/images/macbookPro2.jpeg',
      ],
      [
        'assets/images/rog1.jpeg',
        'assets/images/rog2.jpeg',
        'assets/images/rog3.jpeg',
        'assets/images/rog4.jpeg',
      ],
      [
        'assets/images/dell1.jpg',
        'assets/images/dell2.jpg',
        'assets/images/dell3.jpg',
        'assets/images/dell4.jpg',
      ]
    ],
    [
      [
        'assets/images/LG1.jpg',
        'assets/images/LG2.jpg',
        'assets/images/LG3.jpg',
      ],
      [
        'assets/images/benq1.jpg',
        'assets/images/benq2.jpg',
        'assets/images/benq3.jpg',
        'assets/images/benq4.jpg',
      ],
      [
        'assets/images/lenovoThinkvision1.jpg',
        'assets/images/lenovoThinkvision2.jpg',
        'assets/images/lenovoThinkvision3.jpg',
        'assets/images/lenovoThinkvision4.jpg',
      ]
    ],
  ];

  List<Column> cols = [];

  toggleActive(int index) {
    for (int i = 0; i < 4; i++) {
      active[i] = false;
    }
    active[index] = true;
  }

  @override
  void initState() {
    super.initState();
    cols = [
      Column(
        children: [
          itemCard('MacBook Pro 16inch', 'assets/images/macbookPro1.jpeg', ls[0][0],
              '1200'),
          itemCard('Asus ROG Strix G15', 'assets/images/rog1.jpeg', ls[0][1], '900'),
          itemCard('Dell Inspiron 14', 'assets/images/dell1.jpg', ls[0][2], '800'),
        ],
      ),
      Column(
        children: [
          itemCard('LG 4k UHD', 'assets/images/LG1.jpg', ls[1][0],
              '1200'),
          itemCard('Benq 4k UHD', 'assets/images/benq1.jpg', ls[1][1], '900'),
          itemCard('lenovoThinkvision', 'assets/images/lenovoThinkvision1.jpg', ls[1][2], '800'),
        ],
      ),
      Column(
        children: [
          itemCard('MacBook Pro 16inch', 'assets/images/macbookPro1.jpeg', ls[0][0],
              '1200'),
          itemCard('Asus ROG Strix G15', 'assets/images/rog1.jpeg', ls[0][1], '900'),
          itemCard('Dell Inspiron 14', 'assets/images/dell1.jpg', ls[0][2], '800'),
        ],
      ),
      Column(
        children: [
          itemCard('LG', 'assets/images/LG1.jpg', ls[1][0],
              '1200'),
          itemCard('Benq', 'assets/images/benq1.jpg', ls[1][1], '900'),
          itemCard('lenovoThinkvision', 'assets/images/lenovoThinkvision1.jpg', ls[1][2], '800'),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Material(
              elevation: 2.0,
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleActive(0);
                        });
                      },
                      child:
                          Card('assets/icons/laptop.png', 'Laptop', active[0]),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleActive(1);
                          });
                        },
                        child: Card(
                            'assets/icons/monitor.png', 'Monitor', active[1])),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleActive(2);
                          });
                        },
                        child: Card('assets/icons/keyboard1.png', 'KeyBoard',
                            active[2])),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleActive(3);
                          });
                        },
                        child:
                            Card('assets/icons/mouse.png', 'Mouse', active[3])),
                  ],
                ),
              ),
            ),
          ),
        ),
        // itemCard('MacBook Pro 16inch', 'assets/images/macbookPro1.jpeg', ls[0][0],
        //     '1200'),
        // itemCard('Asus ROG Strix G15', 'assets/images/rog1.jpeg', ls[0][1], '900'),
        // itemCard('Dell Inspiron 14', 'assets/images/dell1.jpg', ls[0][2], '800'),
        // selectedRibbon(),
        currentSelected(),
      ],
    );
  }

  

  Widget currentSelected() {
    
    for(int i =0;i<4;i++){
      if(active[i]){
        return cols[i];
      }
    }
    return cols[0];
  }
  //* ITEM CARD

  Widget itemCard(
      String title, String imgpath, List<String> photos, String price) {
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
                        onTap: () {},
                        child: Material(
                          elevation: 5.0,
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
                                'Add to cart',
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
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
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
          active
              ? Material(
                  elevation: 2.0,
                  child: Container(
                    height: 5.0,
                    width: MediaQuery.of(context).size.width / 4 - 20.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
