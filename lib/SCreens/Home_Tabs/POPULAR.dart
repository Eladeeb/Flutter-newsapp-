import 'package:flutter/material.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,position){
          return Card(
              child: _drawSinglRow(),

          );

        },itemCount: 20,
    );
  }
  Widget _drawSinglRow()
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
                        Text('The Word Global Warming Annual Summit',maxLines: 2,style: TextStyle(
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
}
