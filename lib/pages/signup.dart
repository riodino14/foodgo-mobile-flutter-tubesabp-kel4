import 'package:flutter/material.dart';
import 'package:tubes_abp/pages/login.dart';
import 'package:tubes_abp/service/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              padding: EdgeInsets.only(top: 30.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffffefbf),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
              ), 
              child: Column(
                children: [
                  Image.asset("images/pan.png", height: 180, fit: BoxFit.fill, width: 240,),
                  Image.asset("images/logo.png",width: 150, height: 50, fit:BoxFit.cover,),
                ],
              ),
            ), 
            Container(

              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.2, left: 20.0, right: 20.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0,right: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),),
                  height: MediaQuery.of(context).size.height/1.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 20.0,),
            Center(child: Text("SignUp", style: AppWidget.HeadLineTextFieldStyle(),)),
            SizedBox(height: 30.0,),
            Text("Name", style: AppWidget.SignUpTextFieldStyle(),
            ),
            SizedBox(height: 5.0,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, hintText: "Enter Name", prefixIcon: Icon(Icons.person_outline)
              ),

            ),
            ),
            SizedBox(height: 20.0,),
            Text("Email", style: AppWidget.SignUpTextFieldStyle(),
            ),
            SizedBox(height: 5.0,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, hintText: "Enter Email", prefixIcon: Icon(Icons.mail_outline)
              ),

            ),
            ),
            SizedBox(height: 20.0,),
            Text("Password", style: AppWidget.SignUpTextFieldStyle(),
            ),
            SizedBox(height: 5.0,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, hintText: "Enter Password", prefixIcon: Icon(Icons.password_outlined)
              ),
            ),
            ),
            SizedBox(height: 30.0,),
            Center(
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(color: Color(0xffef2b39), borderRadius: BorderRadius.circular(30)),
                child: Center(child: Text("Sign Up", style: AppWidget.boldWhiteTextFieldStyle(),)),
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Already have an account?", style: AppWidget.SignUpTextFieldStyle(),),
              SizedBox(width: 10.0,),
              GestureDetector(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
                },
                child: Text("LogIn", style: AppWidget.boldTextFieldStyle(),))
            ],)
          ],
        ),
      ),
              ),
            )
          ],
        ),
      ), 
    ); 
  }
}
