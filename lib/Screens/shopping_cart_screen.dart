import 'package:flutter/material.dart';
import 'package:furniture_app/Reusable%20Components/BottomNavBar.dart';
import 'package:furniture_app/ShoppingCartPage/ShopCartTopContainer.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({ Key? key }) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> with SingleTickerProviderStateMixin {
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
        shrinkWrap: true,
        children: [
          Column(
            children: [
              ShopCartTopContainer(),
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(elevation: 5.0, child: SizedBox(height: 60, child: BottomNavBar(controller: controller, activated: 1,))),
    );
  }
}