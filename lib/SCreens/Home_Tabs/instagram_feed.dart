import 'package:flutter/material.dart';
import 'package:fluttertest/Shared_ui/Navigation_Drawer.dart';
class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle =TextStyle(
    color: Colors.orange,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feeds"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),


                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
  Widget _drawHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(backgroundImage: ExactAssetImage("assets/images/t.jpg"),
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

                  ],
                ),
                SizedBox( height: 8, ),
                Text("Fri, 11 Dec 1999 , 14.30",style: TextStyle(
                  color: Colors.grey,
                ),
                ),

                  ],
                ),
              ],
            ),
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.favorite,color: Colors.grey.shade400,),onPressed: (){},),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text("25",style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
              ),),
            ),
      ],
    )
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("We also talk about the future work as the robots ",style: TextStyle(
        color: Colors.grey.shade900,
      ),),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashTagStyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashTagStyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashTagStyle,)),
        ],
      ),
    );
  }
  Widget _drawBody(){
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.25,
      child: Image(image: ExactAssetImage("assets/images/ooo.jpg"),
      fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(onPressed: (){}, child: Text('10 COMMENTS',style: _hashTagStyle,)),
        Row(
          children: <Widget>[
            Transform.translate(
              offset: Offset(20, 0),
                child: FlatButton(onPressed: (){}, child: Text('SHARE',style: _hashTagStyle,))),
            FlatButton(onPressed: (){}, child: Text('OPEN',style: _hashTagStyle,)),
          ],
        ),
      ],
    );
  }

}
