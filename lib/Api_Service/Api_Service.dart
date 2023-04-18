import 'dart:convert';
import 'dart:io';
import 'package:api_calling/Models/Post_Data_Model.dart';
import 'package:api_calling/Models/pray_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../Models/Model.dart';
import '../Models/UserData_Model.dart';


///this is list of data
Future<List<Model>?> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    final model = json.decode(response.body).cast<Map<String, dynamic>>();
    return model.map<Model>((json) => Model.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');}}


///this is list of data
Future<List<USerData>> Userget() async {
  var dio = Dio();
  final response = await dio.get('https://jsonplaceholder.typicode.com/users');
  if (response.statusCode == 200) {
    print("respons ==> ${response.data}");
    return (response.data as List).map((e) => USerData.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load album');}}




Future<Patientdata> postdata(FormData? data) async {
  final dio = Dio();
  String url ='https://hetal.byteztech.com/hp_service/interview/store.php';
  final reasponse = await dio.post(url,
    data: data,
  );
 if(reasponse.statusCode == 200){
   print(reasponse.data);
   return Patientdata.fromJson(reasponse.data);
 }
 else{
   throw Exception('Failed to load album');
 }
}


Future<List<PrayModel>> get_pray_data()async{
  var dio = Dio();
  final respons = await dio.get("https://islamenc.in/api/quran/1.json");
  if(respons.statusCode ==200){
    print('respons Data ===> ${respons.data}');
    return (respons.data as List).map((e) => PrayModel.fromJson(e)).toList();
  }
  else {
    throw Exception('Failed to load album');
  }
}
