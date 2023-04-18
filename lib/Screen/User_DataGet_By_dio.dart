import 'package:api_calling/Models/UserData_Model.dart';
import 'package:flutter/material.dart';

import '../Api_Service/Api_Service.dart';

class User_Data extends StatefulWidget {
  const User_Data({Key? key}) : super(key: key);

  @override
  State<User_Data> createState() => _User_DataState();
}

class _User_DataState extends State<User_Data> {
  List<USerData> user = [];
  List<USerData> user1 = [];

  GETdata() async {
    user = await Userget();
    print("GetData ==> ${user.length}");
    setState(() {});
  }


  search_data({String? text}){
    user1.clear();
    if(text!.isEmpty){
      setState(() {});
      return ;
    }
    user.forEach((element) {
      if(element.name.toLowerCase().contains(text.toLowerCase())||
      element.name.toUpperCase().contains(text.toUpperCase())){
        user1.add(element);
      }
    });
    setState(() {});


  }

  @override
  void initState() {
    super.initState();
    GETdata();
    print('call ==================================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: SizedBox(
              width: 390,
              child: TextField(
                onChanged: (value) {
                  search_data(text: value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
              ),
            ),
          ),
        ],
        // title: Text('Api is Called by dio  ||  ListType '),
      ),
      body:
          // Center()
        user1.isEmpty?  ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(user[index].name),
                    subtitle: Text(user[index].email),
                    leading: Text('${user[index].id}'));
              }):ListView.builder(
            itemCount: user1.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(user1[index].name),
                  subtitle: Text(user1[index].email),
                  leading: Text('${user1[index].id}'));
            }),
    );
  }
}
