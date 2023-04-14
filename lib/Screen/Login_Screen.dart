import 'dart:io';

import 'package:api_calling/Api_Service/Api_Service.dart';
import 'package:api_calling/Models/Post_Data_Model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import '../Custom_Widget/Button_Widget.dart';
import '../Custom_Widget/Text_Form_Widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var  email = TextEditingController();
  var  name = TextEditingController();
  var  mobile = TextEditingController();

  final _loginkey = GlobalKey<FormState>();
  late File image;
  ImagePicker _imagePicker = ImagePicker();

  clean_data() {
    email.clear();
    name.clear();
    mobile.clear();
  }

  // get_image() async{
  //   final img  = await _imagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //    image = File(img!.path);
  //   });
  // }

  // login(context) async {
  //   if (_loginkey.currentState!.validate()) {
  //    postdata(FormData.fromMap({
  //
  //      'patient_name': name.text,
  //      'patient_email':email.text,
  //      'patient_mobile': mobile.text
  //      // 'patient_image': await MultipartFile
  //    }));
  //     clean_data();
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(
                    child: Text('Login',
                        style:
                            TextStyle(color: Color(0XffA1A1A9), fontSize: 40)),
                  ),
                  Image.network(
                    'https://img.freepik.com/premium-vector/registration-sign-up-user-interface-users-use-secure-login-password-collection-online_566886-2046.jpg?w=740',
                  ),
                  Center(
                    child: IconButton(
                        onPressed: () {
                          // get_image();
                        },
                        icon: const Icon(Icons.camera_alt_outlined,size: 30,)),
                  ),
                  const Center(
                    child: Text(
                      'Please Select Image',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Textfield(
                    prefixIcon: Icons.person,
                    Hindtext: 'Name',
                    controller: name,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Textfield(
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    Hindtext: 'Email',
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'PLease enter email';
                      } else if (!RegExp('@').hasMatch(value)) {
                        return 'Please enter valid email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Textfield(
                    prefixIcon: Icons.call,
                    Hindtext: 'Mobile',
                    keyboardType: TextInputType.number,
                    controller: mobile,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'PLease enter number';
                      } else if (value.length < 10) {
                        return 'Please enter valid number';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  button(
                    name: "Login".toUpperCase(),
                    onTap: () {
                      // login(context);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: MediaQuery.of(context).size.height / 50,
                              color: const Color(0XffA1A1A9))),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                                color: const Color(0XffFEA53F),
                                fontFamily: 'poppins'),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
