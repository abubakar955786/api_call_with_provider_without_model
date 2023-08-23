import 'package:flutter/material.dart';
import 'api_services.dart';

class ApiProvider with ChangeNotifier{

  dynamic apiResponse;

  bool isLoading = true;

  getData()async{
    await ApiServices().getData().then((value){

      apiResponse = value;


      print(value);
    }).onError((error, stackTrace){
      print(error.toString());
    });

    isLoading = false;
    notifyListeners();
  }


}