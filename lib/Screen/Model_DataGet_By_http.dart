import 'package:api_calling/Blocs/ApiBloc/ApiBloc.dart';
import 'package:api_calling/Blocs/ApiBloc/ApiStateBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Api_Service/Api_Service.dart';
import '../Models/Model.dart';

class Model_Data extends StatefulWidget {
  @override
  State<Model_Data> createState() => _Model_DataState();
}

class _Model_DataState extends State<Model_Data> {
  late bool _isLoading = false;
  late List<Model>? model = [];

  @override
  void initState() {
    super.initState();
    // _getData();

  }

  void _getData() async {
    setState(() {
      _isLoading = true;
    });
    model = await fetchAlbum();


    setState(() {
      _isLoading = false;
    });

    print('Model_Data_length = ${model!.length}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api is Called by http  ||  ListType '),
      ),
      body:
      // _isLoading
      //     ? Center(child: const CircularProgressIndicator())
      //     : model!.isEmpty
      //         ? const Center(
      //             child: Text(
      //             'No Data',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.black,
      //                 fontWeight: FontWeight.bold),
      //           ))
      //         :
     BlocBuilder<ApiBloc,ApiState>(builder: (context, state) {
       if(state is ApiLoadingState){
         return Center(child: CircularProgressIndicator(),);
       }
       else if(state is ApiLoadedState){
         return  ListView.builder(
             itemCount: state.pray_model?.length,
             itemBuilder: (context, index) {
               var data = state.pray_model?[index];
               return ListTile(
                   title: Text("${data?.ayatNoArabic}"),
                   leading: Text('${data?.translation}'));
             });
       }
       return Center(child: Text('An error occured!'),);
     },)
    );
  }
}
