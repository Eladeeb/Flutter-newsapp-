import 'dart:convert';
import 'package:fluttertest/models/post.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:fluttertest/Utilities/api_utilities.dart';
class PostAPI{

   Future<List<Post>> fetchWhatsNew()async{
     List<Post> posts=List<Post>();
   final String whatsNewApi ="http://192.168.0.10/dashboard/first_pro/public/posts";
   var response = await http.get(
        Uri.encodeFull(whatsNewApi),
    headers: {"Accept":"application/json"});
      print(response.body);
    if( response.statusCode  ==  200)
      {
        var jsonData=jsonDecode(response.body);
        var data = jsonData("data");
        for(var item in data)
          {
            Post post=Post(
                id: item['id'].toString(),
                title: item['title'].toString(),
                content: item['content'].toString(),
                dateWritten: item['date_written'].toString(),
                featuredImage: item['featured_image'].toString(),
                votesUp: item['votes_up'],
                votesDown:item['votes_down'],
                votersUp:jsonDecode(item['voters_up']== null ? List<int>() : jsonDecode(item['voters_up'])),
                votersDown:jsonDecode(item['voters_down']== null ? List<int>() : jsonDecode(item['voters_down'])),
                userId :item['user_id'],
                categoryId: item['category_id']);
            posts.add(post);
          }
      }
    return posts;
  }

}