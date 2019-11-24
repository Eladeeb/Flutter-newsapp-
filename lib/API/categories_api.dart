import 'dart:convert';

import 'package:fluttertest/models/category.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertest/Utilities/api_utilities.dart';
class CategoriesAPI{
  Future<List<Category> > fetchCategories() async{
    List<Category> categories =List<Category>();
    String categoriesURL=base_api+all_Categories_api;
    var response = await http.get(categoriesURL);
    if(response == 200)
      {
        var jsonData =jsonDecode(response.body);
        var data = jsonData("data");
        for(var item in data)
          {
            Category category = Category(item['id'].toString(), item['title'].toString());
            categories.add(category);
            print(category.title);
          }

      }
    return categories ;
  }
}