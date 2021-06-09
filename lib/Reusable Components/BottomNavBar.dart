import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/home_screen.dart';
import 'package:furniture_app/Screens/login_screen.dart';
import 'package:furniture_app/Screens/shopping_cart_screen.dart';

class BottomNavBar extends StatefulWidget {

  TabController controller;
  // List<Color> colors;
  int activated;
  BottomNavBar({required this.controller, required this.activated});
  
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: TabBar(
          
          controller: widget.controller,
          onTap: (index) {
            setState(() {
              widget.activated = index;
              if(index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ShoppingCartScreen();
                }));
              }
              if(index == 0 ){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              }
              if(index == 2 ){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginScreen();
                }));
              }
            });
          },
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(CupertinoIcons.home, color: 0 == widget.activated ? Color(0xffF9C335) : Colors.grey)),
            Tab(icon: Icon(CupertinoIcons.shopping_cart, color: 1 == widget.activated ? Color(0xffF9C335) : Colors.grey)),
            Tab(icon: Icon(CupertinoIcons.person, color: 2 == widget.activated ? Color(0xffF9C335) : Colors.grey)),
          ],
        ),
      );
  }
}

// Tab(icon: Icon(Icons.event_seat, color: widget.colors[0])),
//             Tab(icon: Icon(Icons.timer, color: widget.colors[1])),
//             Tab(icon: Icon(Icons.shopping_cart, color: widget.colors[2])),
//             Tab(icon: Icon(Icons.person_outline, color: widget.colors[3])),