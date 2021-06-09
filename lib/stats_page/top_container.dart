

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/stats_page/widgets/Card1.dart';
import 'package:furniture_app/stats_page/widgets/Card2.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsTopContainer extends StatefulWidget {
  const StatsTopContainer({Key? key}) : super(key: key);

  @override
  _StatsTopContainerState createState() => _StatsTopContainerState();
}

class _StatsTopContainerState extends State<StatsTopContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75.0 / 2),
                      border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 3),
                      image: DecorationImage(
                        image: AssetImage('assets/images/chris.jpg'),
                      )
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pino',
                      style: GoogleFonts.quicksand(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '176****590',
                      style: GoogleFonts.quicksand(
                        fontSize: 15.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 225.0,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: (){},
                    color: Colors.white,
                    iconSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card1(icon: Icons.folder, name: 'Favorites'),
                Card1(icon: Icons.account_balance_wallet, name: 'Wallet'),
                Card1(icon: Icons.print, name: 'Footprint'),
                Card1(icon: Icons.computer,  name: 'Coupon'),
              ],
            ),
            SizedBox(height: 25.0,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card2(imgPath: 'assets/images/card.png',title: 'Pending payment', valueCount: '5',),
                    Card2(imgPath: 'assets/images/box.png',title: 'To be Shipped', valueCount: '3',),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card2(imgPath: 'assets/images/truck.png',title: 'To be recieved', valueCount: '2',),
                    Card2(imgPath: 'assets/images/returnbox.png',title: 'Return / replace', valueCount: '1',),
                  ],
                ),
                SizedBox(height: 6.0),
              ],
            )
          ],
        )
      ],
    );
  }
}
