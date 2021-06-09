import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/stats_screen.dart';
import 'package:furniture_app/ShoppingCartPage/ItemCard.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopCartTopContainer extends StatefulWidget {
  const ShopCartTopContainer({Key? key}) : super(key: key);

  @override
  _ShopCartTopContainerState createState() => _ShopCartTopContainerState();
}

class _ShopCartTopContainerState extends State<ShopCartTopContainer> {
  @override
  void initState() {
    super.initState();
    getTotalAmount();
  }
  List<int> price = [800, 1200, 900];
  List<bool> picked = [true, true, true];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    totalAmount = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        totalAmount += price[i];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              alignment: Alignment.topLeft,
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Positioned(
          top: 75.0,
          left: 15.0,
          child: Text(
            'Shopping Cart',
            style: GoogleFonts.montserrat(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          top: 150.0,
          child: Column(
            children: [
              ItemCard('Dell Inspiron 14', price[0].toString(), 'assets/images/dell1.jpg', 0,
                  'grey'),
              ItemCard('Macbook Pro 16inch', price[1].toString(),
                  'assets/images/macbookPro.jpeg', 1, 'grey'),
              ItemCard('Asus ROG Strix G15', price[2].toString(), 'assets/images/rog1.jpeg',
                  2, 'black'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height - 65, bottom: 15.0),
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.white,
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
                    onTap: () {},
                    child: Material(
                      elevation: 0.5,
                      child: Container(
                        color: Colors.red,
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
          ),
        )
      ],
    );
  }

  Widget ItemCard(
      String itemName, String price, String imgPath, int i, String color) {
    return InkWell(
      onTap: () {
        pickToggle(i);
      },
      child: Padding(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12.5),
                      ),
                      child: Center(
                          child: Container(
                        height: 12.0,
                        width: 12.0,
                        decoration: BoxDecoration(
                          color: picked[i]
                              ? Colors.yellow
                              : Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: 150.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          itemName,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        picked[i]
                            ? Text(
                                'x1',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              )
                            : Container()
                      ],
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      'Color: ' + color,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      '\$' + price,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Color(0xFFFDD34A)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
