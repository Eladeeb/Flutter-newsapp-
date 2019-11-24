import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttertest/SCreens/Home_Tabs/facebook_feed.dart';
import 'package:fluttertest/SCreens/Home_Tabs/instagram_feed.dart';
import 'package:fluttertest/SCreens/Home_Tabs/twitter_feed.dart';
import 'package:fluttertest/SCreens/Screen2.dart';
import 'package:fluttertest/SCreens/headLine_news.dart';
import 'package:fluttertest/models/nav_menu.dart';
class NavigiationDrawer extends StatefulWidget {
  @override
  _NavigiationDrawerState createState() => _NavigiationDrawerState();
}

class _NavigiationDrawerState extends State<NavigiationDrawer> {
  @override
  List<navMenuItem> navigitionMenu=[
    navMenuItem("Explore",() => Screen2()),
    navMenuItem("Headline News",() => HeadLineNews()),
    navMenuItem("Twitter Feeds",() => TwitterFeed()),
    navMenuItem("Instagram Feeds",() => InstagramFeed()),
    navMenuItem("Facebook Feeds",() => FacebookFeeds()),




  ];
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 25, left: 24),

        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(2),
              child: ListTile(
                title: Text(navigitionMenu[position].title, style: TextStyle(
                  color: Colors.grey.shade700, fontSize: 22,
                ),
                ),
                trailing: Icon(Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  prefix0.Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>navigitionMenu[position].destination() ));
                },
              ),

            );
          },
          itemCount: navigitionMenu.length,
        ),

      ),
    );
  }


}
