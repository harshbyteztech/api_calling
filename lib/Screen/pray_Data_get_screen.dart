import 'package:api_calling/Api_Service/Api_Service.dart';
import 'package:api_calling/Models/pray_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class pray_screen extends StatefulWidget {
  const pray_screen({Key? key}) : super(key: key);

  @override
  State<pray_screen> createState() => _pray_screenState();
}

class _pray_screenState extends State<pray_screen> {

  List <PrayModel> prayData = [];
  getData()async{
    prayData = await get_pray_data();
    print('prayData==> ${prayData.length}');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: prayData.length,
        itemBuilder: (context, index) {
         var data = prayData[index];
         return  ListTile(onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => pray_screen2(details: data),));
         },title: Text('${data.arabicAyat}'),
           subtitle:Text('${data.translation}'),
         );
      },),
    );
  }
}


class pray_screen2 extends StatefulWidget {
   pray_screen2({this.details});
   PrayModel? details;

  @override
  State<pray_screen2> createState() => _pray_screen2State();
}

class _pray_screen2State extends State<pray_screen2> {

  // List <PrayModel> prayData = [];
  // getData()async{
  //   prayData = await get_pray_data();
  //   print('prayData==> ${prayData.length}');
  //   setState(() {});
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("${widget.details?.arabicAyat}"),),
      body: Html(data: '${widget.details?.tafsir}',),
    );
  }
}