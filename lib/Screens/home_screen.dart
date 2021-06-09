import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/Screens/pro_des_screen.dart';
import 'package:furniture_app/home_page/catagories_ribbon.dart';
import 'package:furniture_app/home_page/top_container.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              //top container
              HomeTopContainer(),
              //below search
              SizedBox(
                height: 10.0,
              ),
              HomeCatRibbon(),
              
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: SizedBox(
            height: 60,
            child: BottomNavBar(
              controller: controller,
              activated: 0,
            )),
      ),
    );
  }

}
