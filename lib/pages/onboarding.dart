import 'package:flutter/material.dart';
import 'package:tubes_abp/pages/signup.dart';
import 'package:tubes_abp/service/widget_support.dart';
import 'package:tubes_abp/pages/signup.dart'; // Import Sign Up Page

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
                // Navigate to Sign Up page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ), // Replace with your Sign Up page
                );
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
}
