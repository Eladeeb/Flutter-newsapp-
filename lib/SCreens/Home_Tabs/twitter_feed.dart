import 'package:flutter/material.dart';
import 'package:fluttertest/Shared_ui/Navigation_Drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),

        ],
      ),
      drawer: NavigiationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(4),
          itemBuilder: (context,position){
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _cardHeader(),
                    _cardBody(),
                    _drawDivider(),
                    _cardFooter(),

                  ],
                ),
              ),
            );
      },
        itemCount: 20,
      ),
    );
  }
  Widget _cardHeader(){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(backgroundImage: ExactAssetImage("assets/images/orr.jpg"),
            radius: 24,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Eslam Abdo",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox( width: 8,),
                Text("@Es_Eladeeb",style: TextStyle(
                  color: Colors.grey,
                ),),
              ],
            ),
            SizedBox( height: 8, ),
            Text("Fri, 11 Dec 1999 , 14.30",style: TextStyle(
    color: Colors.grey,
    ),
    ),
          ],
        )
      ],
    );
  }
  Widget _cardBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16 ,right: 16 ,bottom: 8 ),
      child: Text("We also talk about the future work as the robots advanced , and we  ask wether a retro phone ",style: TextStyle(
        fontSize: 16,
        height: 1.2,
        color: Colors.grey.shade900,
      ),),
    );
  }
  Widget _cardFooter(){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.repeat,size: 28,),color: Colors.blue.shade700,onPressed: (){},),
              Text("25",style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text("SHARE",style: TextStyle(
                  color: Colors.blue.shade700
              ),)),
              FlatButton(onPressed: (){}, child: Text("OPEN",style: TextStyle(
                  color: Colors.blue.shade700
              ),)),

            ],
          ),

        ],
      ),
    );
  }
  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.red,
      margin: EdgeInsets.only(top: 16),
    );

  }


}
