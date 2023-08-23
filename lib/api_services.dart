import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices{

  Future<dynamic> getData()async{
    
    dynamic apiData;
    
    var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if(response.statusCode == 200 || response.statusCode == 201){

      apiData = jsonDecode(response.body);

    }else{
      print("Error");
    }

    return apiData;
  }
}