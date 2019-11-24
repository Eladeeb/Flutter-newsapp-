import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'Screen2.dart';
class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  ValueNotifier<int> _pageVewNotifier=ValueNotifier(0);
  List <pagemodel> pages;
  void _addpage(){
    pages =List<pagemodel>();
    pages.add(pagemodel("", "",  "assets/images/orr.jpg"));
    pages.add(pagemodel("", "",  "assets/images/ooo.jpg"));
    pages.add(pagemodel(" ", "",  "assets/images/oooo.jpg"));
    pages.add(pagemodel(" ", "",  "assets/images/ooooo.jpg"));
  }
  @override
  Widget build(BuildContext context) {
    _addpage();
    return Stack(
      children: <Widget>[
        Scaffold(
                 body: PageView.builder(
                   itemBuilder: (context,index){
                     return Stack(
                       children: <Widget>[
                         Container(
                           decoration: BoxDecoration(
                             image:DecorationImage(image: ExactAssetImage(pages[index].i

                             ),
                               fit: BoxFit.cover,
                             )
                           ),

                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[

                                Center(
                                  child: Text(pages[index].t, style: TextStyle(
                                   fontWeight: FontWeight.bold ,
                                   fontSize: 48 ,
                                   color: Colors.black,
                               ),textAlign: TextAlign.center,
                               ),
                                ),
                             Center(
                               child: Padding(
                                 padding: const EdgeInsets.only(top: 15),
                                 child: Text(pages[index].d, style: TextStyle(
                                   fontWeight: FontWeight.bold ,
                                   fontSize: 44 ,
                                   color: Colors.black,
                                 ),textAlign: TextAlign.center,
                                 ),
                               ),
                             ),
                           ],
                         )
                       ],
                     );
                   },
                   itemCount: pages.length,
                   onPageChanged: (index)
                   {
                     _pageVewNotifier.value=index ;
                   },

                 ),
        ),
        Transform.translate(
          offset:Offset(0,75),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageViewIndicator(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom : 10),
            child: SizedBox(
              width: 340,
              height: 40,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text('GET STARTED',style: TextStyle(
                  color: Colors.white,fontSize: 16,letterSpacing: 1.5,
                ),),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context){
                      _UpdateSeen();
                      return Screen2();
                    },
                  ),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _displayPageViewIndicator(int length)
  {
    return PageViewIndicator(
      pageIndexNotifier: _pageVewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.deepPurpleAccent,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.black45,
        ),
      ),
    );
  }

  void _UpdateSeen()async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);

  }
}
class pagemodel{
  String _t ;
  String _d ;
  String _i ;

  set t(String value) {
    _t = value;
  }

  pagemodel(this._t, this._d, this._i);

  set d(String value) {
    _d = value;
  }

  String get d => _d;

  set i(String value) {
    _i = value;
  }

  String get t => _t;

  String get i => _i;

}
