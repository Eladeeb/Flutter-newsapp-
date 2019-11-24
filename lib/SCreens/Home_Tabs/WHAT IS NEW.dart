import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/API/posts_api.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'dart:async';

import 'package:fluttertest/models/post.dart';
import 'package:http/http.dart'as http;

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),

        ],
      ),
    );
  }

  PostAPI postAPI;
  @override
  void initState() {
    postAPI = new PostAPI();
    super.initState();
  }

  Widget _drawHeader()
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.23,
      padding: EdgeInsets.only(left: 48,right: 48 ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage("assets/images/two.jpg"),
            fit: BoxFit.cover
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               Text("How Terries & Royals Gatecrashed Final",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                 fontWeight: FontWeight.bold,

              ),
                 textAlign: TextAlign.center,
              ),
               SizedBox(
                 height: 8,
               ),

               Text("Lorem ipsum dolor sit amet,Consecteture adipiscing elit,sed do eiumod",style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                 fontWeight: FontWeight.bold,

              ),
                 textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:const EdgeInsets.only(left: 16,top: 16),
            child :_drawSectionTitle("Top Stories"),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future:postAPI.fetchWhatsNew(),
                builder: (context,AsyncSnapshot snapShot){
                  if (snapShot.connectionState == ConnectionState.none &&
                      snapShot.hasData == null) {
                     return CircularProgressIndicator();
                  }
                  Post post0 = snapShot.data[0];
                  Post post2 = snapShot.data[2];
                  Post post3 = snapShot.data[3];
                  return Column(
                    children: <Widget>[
                      _drawSinglRow(post0),
                      _drawDivider(),
                      _drawSinglRow(post2),
                      _drawDivider(),
                      _drawSinglRow(post3),
                      _drawDivider(),
                    ],
                  );

                },

              ),
            ),
          ),

        ],
          ),
      );

  }
  Widget _drawRecentUpdates(){
    return Padding(
      padding: EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _drawSectionTitle("Recent Updates"),
          ),
          _drawRecentUpdateCard(),
          _drawDivider(),
          _drawRecentUpdateCard(),
          SizedBox(
            height: 48,
          )

        ],
      ),
    );

  }
  Widget _drawSinglRow(Post post)
  {
    return Padding(
      padding:EdgeInsets.only(top:4.0,bottom: 4,left: 8,right: 8),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    child: Image(image:
                    ExactAssetImage("assets/images/sty.jpg"),
                      fit: BoxFit.cover,

                    ),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    width: 16 ,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(post.title,
                          maxLines: 2,
                          style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Eslam Abdo'),
                            SizedBox(
                              width: 50,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.timer),
                                Text('15 min'),

                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],

              ),
            ),

          ],

        ),
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.red,
    );

  }


  Widget _drawSectionTitle(String s) {

    return Text(s,style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,

      ),
      );
  }

  Widget _drawRecentUpdateCard() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration:BoxDecoration(
            image: DecorationImage(image: ExactAssetImage("assets/images/oooooo.jpg"),
              fit: BoxFit.cover,
            )

            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.25 ,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16,bottom: 8),
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 4),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(4),

              ),
              child: Text("Fashion",style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left : 16.0,top: 8 ,bottom: 8),
            child: Text("Vettel is Fashion Number one - Hamilton",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: <Widget>[
              Transform.translate(
                offset: Offset(0,0),
                  child: Icon(Icons.timer,
                  color: Colors.grey,
                    size: 18,
                  ),
              ),
              Text("15 min",textAlign: TextAlign.center,style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}
