
import 'package:api_demo_app/homepage.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo'),
        centerTitle: true,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: screenWidth*0.80,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Email',style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth*0.80,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('Password',style: TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Submit')),
        ],
      ),
    );
  }
}
