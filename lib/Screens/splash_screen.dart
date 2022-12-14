import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/FormBuilder/FormBuilderScreen.dart';
import 'package:project/Home/HomeScreen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final timer = Timer(Duration(seconds: 3), (() {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => form()), (route) => false);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Center(
                child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1658203897373-9ba844573252?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c29jaWElMjBsbWVkaWElMjBsb2dvc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
              radius: 80,
            ))
          ],
        ));
  }
}
