import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/services/usermanagement.dart';
import 'package:furniture_app/stats_page/top_container.dart';
import 'package:furniture_app/stats_page/widgets/ListItemsCard.dart';


class StatsScreen extends StatefulWidget{

  
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> with SingleTickerProviderStateMixin {

  late TabController controller;
  
  List<Color> colors = [
    Colors.yellow,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  @override
  void initState() {
    super.initState();
    loggedIn();
    controller = new TabController(length: 3, vsync: this);
  }
  loggedIn() {
    userStatus = isLoggedIn();
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
              StatsTopContainer(),
              SizedBox(height: 15.0,),
              // ListItemCard(title: 'Gift Card', buttonColor: Colors.red, iconButton: Icons.account_box),
              // ListItemCard(title: 'Bank card', buttonColor: Color(0xffE89300), iconButton: Icons.account_box),
              // ListItemCard(title: 'Replacement code', buttonColor: Color(0xffFB8662), iconButton: Icons.account_box),
              // ListItemCard(title: 'Consulting collection', buttonColor: Colors.blue, iconButton: Icons.account_box),
              // ListItemCard(title: 'Customer service', buttonColor: Color(0xffECB800), iconButton: Icons.account_box),
            ],
          )
        ],
      ),
      // bottomNavigationBar: Material(elevation: 5.0, child: SizedBox(height: 60, child: BottomNavBar(controller: controller, activated: 0,))),
    );
  }
}