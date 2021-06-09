import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItemCard extends StatelessWidget {
  String title;
  Color buttonColor;
  IconData iconButton;

  ListItemCard(
      {required this.title,
      required this.buttonColor,
      required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: buttonColor.withOpacity(0.3),
            ),
            child: Icon(
              iconButton,
              color: buttonColor,
              size: 25.0,
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
