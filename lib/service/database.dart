import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addUserOrderDetails(
    Map<String, dynamic> userOrderMap,
    String id,
    String orderid,
  ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Orders")
        .doc(orderid)
        .set(userOrderMap);
  }

  Future addAdminOrderDetails(
    Map<String, dynamic> userOrderMap,
    String orderid,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Orders")
        .doc(orderid)
        .set(userOrderMap);
  }

  Future<Stream<QuerySnapshot>> getUserOrder(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Orders")
        .snapshots();
  }

  Future<QuerySnapshot> getUserWalletbyemail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("Email", isEqualTo: email)
        .get();
  }

  Future updateUserWallet(String amount, String id) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).update({
      "Wallet": amount,
    });
  }

  Future<Stream<QuerySnapshot>> getAdminOrders() async {
    return FirebaseFirestore.instance
        .collection("Orders")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future updateAdminOrder(String id) async {
    return await FirebaseFirestore.instance.collection("Orders").doc(id).update(
      {"Status": "Delivered"},
    );
  }

  Future updateUserOrder(String userid, String docid) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .collection("Orders")
        .doc(docid)
        .update({"Status": "Delivered"});
  }

  Future<Stream<QuerySnapshot>> getAllUsers() async {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future deleteUser(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .delete();
  }
}
