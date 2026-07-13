import 'dart:convert';


void main(){

  String apiData ='{"name" : "aa","subject" : "paython"}';

  //now we want to accces data like 
  //apiData['name']
  // print(apiData['name']);

  Map<String ,dynamic> mapData = jsonDecode(apiData);

  print(mapData['name']);
}