import 'package:flutter/material.dart';
import 'package:tubes_abp/Admin/admin_login.dart';
import 'package:tubes_abp/pages/signup.dart';
import 'package:tubes_abp/service/widget_support.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image.asset("images/onboard.png"),
            SizedBox(height: 20.0),
            Text(
              "The Best\nFood Delivery",
              textAlign: TextAlign.center,
              style: AppWidget.HeadLineTextFieldStyle(),
            ),
            SizedBox(height: 30.0),
            Text(
              "Order food from your favorite restaurant\n and get it delivered\nfast and easy.",
              textAlign: TextAlign.center,
              style: AppWidget.SimpleLineTextFieldStyle(),
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                // Show the login box when the button is clicked
                _showLoginOptions(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff8c592a),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the login options box
  void _showLoginOptions(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 250, // You can adjust the height as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login as:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SignUp(), // Navigate to User Sign Up
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff8c592a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "User",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                AdminLogIn(), // Navigate to Admin Login
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff8c592a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Admin",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
