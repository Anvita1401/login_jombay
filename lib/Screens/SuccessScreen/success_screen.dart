import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading:true,


      ),
      body: Center(
        child: Text("Successfully Logged in")
      ),
    );
  }
}
