

import 'package:api_calling/Blocs/ApiBloc/ApiStateBloc.dart';
import 'package:api_calling/Models/pray_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Api_Service/Api_Service.dart';

class ApiBloc extends Cubit<ApiState>{
  ApiBloc() : super(ApiLoadingState()){
    fetchData();
  }

  void fetchData()async{
    try{
    List<PrayModel> pray_model = await get_pray_data();
    emit(ApiLoadedState(pray_model: pray_model));
    }
    catch(ex){
      emit(ApiErrorState(ErrorMessage: ex.toString()));
    }
  }

}