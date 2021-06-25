import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


bool status = false;

  bool isLoggedIn() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      status = true;
    } else{
      status = false;
    }
    return status;
  }
