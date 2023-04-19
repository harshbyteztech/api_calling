import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({this.name, this.onTap,this.Button_color});

  late String? name;
  final GestureTapCallback? onTap;
  final Color? Button_color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Button_color??Colors.blue.shade200,
        ),
        child: Center(
            child: Text(
              name!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}