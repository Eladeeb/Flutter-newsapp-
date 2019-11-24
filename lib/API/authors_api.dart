import 'dart:convert';

import 'package:fluttertest/models/author.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertest/Utilities/api_utilities.dart';
class AuthorsAPI{

  Future<List<Author>>  fetchAllAuthors()async{
  List<Author>authors=List<Author>();
  String allAuthorsApi =base_api+all_Authors_api;
  var response = await http.get(allAuthorsApi);

  if(response.statusCode == 200)
    {
      var jsonData=jsonDecode(response.body);
      var data =jsonData("data");
      for(var item in data)
        {
          Author author = Author(item['id'].toString(),item['name'].toString() , item['email'].toString(),item['avatar'].toString());
          authors.add(author);
        }
    }

      return authors ;

}
}