import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield(
      { this.Hindtext, this.suffix,this.onChanged,this.keyboardType,this.prefixIcon,this.obscureText,this.icon, this.controller,this.validator});


  late String? Hindtext;
  late  Widget? suffix;
  late FormFieldValidator<String>? validator;
  late  IconData? prefixIcon;
  late bool? obscureText,icon;
  late TextInputType? keyboardType;
  late TextEditingController? controller = TextEditingController();
  ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText == true ? true: false,
      validator: validator,
       onChanged:onChanged ,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Poppins',
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Color(0XffA1A1A9),
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
        suffix: suffix,
        hintText: Hindtext,
        prefix: icon == true ? SizedBox(width: 10,):null,
        prefixIcon: icon == true ? null:Icon(prefixIcon),
      ),
    );
  }
}