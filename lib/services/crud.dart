import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_app/services/usermanagement.dart';

class CrudMethods{

  Future<void> addData(testData) async{
    if(isLoggedIn()){
      FirebaseFirestore.instance.collection('testCrud').add(testData).catchError((e){
        print(e);
      });
    } else{
      print('you need to be logged in!');
    }
  } 

  getData() async{
    return await FirebaseFirestore.instance.collection('testCrud').get();
  }

}