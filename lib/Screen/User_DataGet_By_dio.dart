import 'package:api_calling/Models/UserData_Model.dart';
import 'package:flutter/material.dart';

import '../Api_Service/Api_Service.dart';

class User_Data extends StatefulWidget {
  const User_Data({Key? key}) : super(key: key);

  @override
  State<User_Data> createState() => _User_DataState();
}

class _User_DataState extends State<User_Data> {

  late Future<List<USerData>> user;

  @override
  void initState() {
    super.initState();
    user = Userget();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Api is Called by dio  ||  ListType '),
      ),
      body:
      // Center()
      FutureBuilder<List<USerData>>(
        future: user,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return  ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return ListTile(title: Text(snapshot.data![index].name),
                      subtitle:  Text(snapshot.data![index].email),
                      leading: Text('${snapshot.data![index].id}'));
                });
          }return Center(child:CircularProgressIndicator(),);
        },
      ),
    );
  }
}
