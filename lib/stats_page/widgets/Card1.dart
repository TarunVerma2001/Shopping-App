import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Card1 extends StatelessWidget {

  IconData icon;
  String name;

  Card1({required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 40.0,
            onPressed: () {},
          ),
          Text(
            name,
            style: GoogleFonts.quicksand(
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
