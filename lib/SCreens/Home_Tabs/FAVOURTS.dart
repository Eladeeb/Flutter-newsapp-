import 'dart:math';

import 'package:flutter/material.dart';
class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> ColorsList=[
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.brown,
    Colors.indigo
  ];
  Random random = Random();
  Color _getRandomColor(){
    return ColorsList[random.nextInt(ColorsList.length)];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,position){
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow("assets/images/o.jpg"),
                _newsItemRow("assets/images/o.jpg"),
              ],
            ),
          ),

        );

      },itemCount: 20,
    );
  }

  Widget _authorRow(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration:BoxDecoration(
                  image: DecorationImage(image: ExactAssetImage(s),
                    fit: BoxFit.cover,
                  ),
                shape: BoxShape.circle,

              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(left: 0 ,top: 10 ,bottom: 10),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Text("Eslam",style: TextStyle(
                      color: Colors.grey,
                    ),
                    ),
                  ],
                ),
                
                Row(
                  children: <Widget>[
                    Text("15 min.Life Style",style: TextStyle(
                      color: _getRandomColor() ,
                    ),
                    ),

                  ],
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            IconButton (icon: Icon(Icons.bookmark),color: Colors.grey,onPressed: (){

            },),
          ],
        ),
      ],
    );
  }

  Widget _newsItemRow(String s ) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          decoration:BoxDecoration(
              image: DecorationImage(image: ExactAssetImage(s),
                fit: BoxFit.cover,
              )

          ),
          width: 124,
          height: 124 ,
        ),
        Expanded(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left :16.0),
                child: Text("Tech Tent: Old phones and safe Social",style: TextStyle(
                    fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left :16.0),
                child: Text("we also talk about the future of work as robots advanced , and ask whether a retro phone",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.25
                ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
