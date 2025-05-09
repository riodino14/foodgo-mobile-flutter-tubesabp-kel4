import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // Add your database methods here
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async{
  return await FirebaseFirestore.instance.collection("users").doc(id).set(userInfoMap);
  }
}

