
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Data/CartItemData.dart';
import 'package:furniture_app/Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async{
  // Stripe.publishableKey = 'pk_test_51JA4tOSIfksEDcouTYpeCjkoxpUbloUgBVgWZyNWxg32qCxQWDBddb7ucwInFDC2p7clGcxMllB5Z5n0eEKj2oB4008B8PVcj9';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardItemdata(),
      child: MaterialApp(
        title: 'Furniture App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
