import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {
  String itemName, price, imgPath;
  int i;
  String color;
  bool available;
  ItemCard(
      {required this.imgPath,
      required this.available,
      required this.color,
      required this.i,
      required this.itemName,
      required this.price});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(widget.available){
          pickToggle(widget.i);
        }
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
                        color: widget.available
                            ? Colors.grey.withOpacity(0.4)
                            : Colors.red.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(12.5),
                      ),
                      child: Center(
                          child: widget.available
                              ? Container(
                                  height: 12.0,
                                  width: 12.0,
                                  decoration: BoxDecoration(
                                    color: picked[widget.i]
                                        ? Colors.yellow
                                        : Colors.grey.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                )
                              : Container()),
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
                        image: AssetImage(widget.imgPath), fit: BoxFit.contain),
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
                          widget.itemName,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        widget.available
                            ? picked[widget.i]
                                ? Text(
                                    'x1',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Container()
                            : Container()
                      ],
                    ),
                    SizedBox(height: 7.0),
                    widget.available
                        ? Text(
                            'Color: ' + widget.color,
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey),
                          )
                        : OutlineButton(
                            onPressed: () {},
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid),
                            child: Center(
                              child: Text('Find Similar',
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.red)),
                            ),
                          ),
                    SizedBox(height: 7.0),
                          widget.available
                              ? Text(
                                  '\$' + widget.price,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      color: Color(0xFFFDD34A)),
                                )
                              : Container(),
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
