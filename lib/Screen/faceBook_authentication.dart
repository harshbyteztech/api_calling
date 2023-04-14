import 'package:flutter/material.dart';


class faceBook_authentication extends StatefulWidget {
  const faceBook_authentication({Key? key}) : super(key: key);

  @override
  State<faceBook_authentication> createState() => _faceBook_authenticationState();
}

class _faceBook_authenticationState extends State<faceBook_authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blueGrey),
            child: Text('Login with facebook',style: TextStyle(fontSize: 20)),
          )),
        ],
      ),
    );
  }
}
