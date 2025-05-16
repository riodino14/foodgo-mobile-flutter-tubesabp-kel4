import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:random_string/random_string.dart';
import 'package:http/http.dart' as http;
import 'package:tubes_abp/service/constant.dart';
import 'package:tubes_abp/service/database.dart';
import 'package:tubes_abp/service/widget_support.dart';
import 'package:tubes_abp/service/shared_pref.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const DetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic>? paymentIntent;
  int quantity = 1, totalprice = 0;
  String? name, id, email, address, wallet;
  TextEditingController addresscontroller = TextEditingController();

  getthesharedpref() async {
    name = await SharedPreferenceHelper().getUserName();
    id = await SharedPreferenceHelper().getUserId();
    email = await SharedPreferenceHelper().getUserEmail();
    address = await SharedPreferenceHelper().getUserAddress();
    print(name);
    print(id);
    print(email);
    setState(() {});
  }

  getUserWallet() async {
    await getthesharedpref();
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserWalletbyemail(
      email!,
    );
    wallet = "${querySnapshot.docs[0]["Wallet"]}";
    print(wallet);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserWallet();
    totalprice = int.parse(widget.price);
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent?['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Adnan',
        ),
      );
      await displayPaymentSheet();
    } catch (e, s) {
      print('exception: $e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      String orderId = randomAlphaNumeric(10);
      Map<String, dynamic> userOrderMap = {
        "Name": name,
        "Id": id,
        "Quantity": quantity.toString(),
        "Total": totalprice.toString(),
        "Email": email,
        "FoodName": widget.name,
        "FoodImage": widget.image,
        "OrderId": orderId,
        "Status": "Pending",
        "Address": address ?? addresscontroller.text,
      };

      await DatabaseMethods().addUserOrderDetails(userOrderMap, id!, orderId);
      await DatabaseMethods().addAdminOrderDetails(userOrderMap, orderId);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Order Placed Successfully!!",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      );

      showDialog(
        context: context,
        builder:
            (_) => const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text("Payment Successful"),
                    ],
                  ),
                ],
              ),
            ),
      );

      paymentIntent = null;
    } on StripeException catch (e) {
      print("Stripe error: $e");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text("Canceled")),
      );
    } catch (e) {
      print('General error: $e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretkey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      throw Exception('Failed to create payment intent: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            Text(widget.name, style: AppWidget.HeadLineTextFieldStyle()),
            Text("\$${widget.price}", style: AppWidget.priceTextFieldStyle()),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "We've established that most cheeses will melt when baked atop pizza. But which will not only melt but stretch into those gooey, messy strands that can make pizza eating such a delightfully challenging endeavor?",
              ),
            ),
            SizedBox(height: 30.0),
            Text("Quantity", style: AppWidget.SimpleLineTextFieldStyle()),
            SizedBox(height: 10.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity++;
                    totalprice += int.parse(widget.price);
                    setState(() {});
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 30.0),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  quantity.toString(),
                  style: AppWidget.HeadLineTextFieldStyle(),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      quantity--;
                      totalprice -= int.parse(widget.price);
                      setState(() {});
                    }
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "\$" + totalprice.toString(),
                        style: AppWidget.boldWhiteTextFieldStyle(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
                GestureDetector(
                  onTap: () async {
                    if (address == null) {
                      openBox();
                    } else if (int.parse(wallet!) > totalprice) {
                      int updatedwallet = int.parse(wallet!) - totalprice;
                      await DatabaseMethods().updateUserWallet(
                        updatedwallet.toString(),
                        id!,
                      );
                      String orderId = randomAlphaNumeric(10);
                      Map<String, dynamic> userOrderMap = {
                        "Name": name,
                        "Id": id,
                        "Quantity": quantity.toString(),
                        "Total": totalprice.toString(),
                        "Email": email,
                        "FoodName": widget.name,
                        "FoodImage": widget.image,
                        "OrderId": orderId,
                        "Status": "Pending",
                        "Address": address ?? addresscontroller.text,
                      };

                      await DatabaseMethods().addUserOrderDetails(
                        userOrderMap,
                        id!,
                        orderId,
                      );
                      await DatabaseMethods().addAdminOrderDetails(
                        userOrderMap,
                        orderId,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Order Placed Successfully!!",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Add some money to your Wallet",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "ORDER NOW",
                          style: AppWidget.WhiteTextFieldStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future openBox() => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(width: 30.0),
                    Text(
                      "Add the address",
                      style: TextStyle(
                        color: Color(0xff008080),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("Add Address"),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () async {
                    address = addresscontroller.text;
                    await SharedPreferenceHelper().saveUserAddress(
                      addresscontroller.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xff008080),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100);

    return calculatedAmount.toString();
  }
}
