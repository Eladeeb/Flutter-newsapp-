import 'package:flutter/material.dart';
import 'package:fluttertest/Shared_ui/Navigation_Drawer.dart';
import 'Home_Tabs/POPULAR.dart';
import 'Home_Tabs/FAVOURTS.dart';
import 'Home_Tabs/WHAT IS NEW.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
enum PopOutMenu{
  HELP ,ABOUT,CONTACT,SETTINGS
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {

  @override
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
     title: Text("Explore"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs:[
        Tab(
          text:"WHAT'S NEW"
        ),
          Tab(
            text: "POPULAR",
          ),
          Tab(
            text: "FAVOURITES",
          )
        ],controller: _tabController,),
      ),
      drawer: NavigiationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
             WhatsNew(),
            Popular(),
            Favourites(),
          ],controller: _tabController,

        )
        ),
    );
  }

  _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
      return [
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.ABOUT,
          child: Text("ABOUT"),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.CONTACT,
          child: Text("CONTACT"),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.HELP,
          child: Text("HELP"),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.SETTINGS,
          child: Text("SETTINGS"),
        ),
      ];

    },onSelected: (PopOutMenu menu){

    },
    );
  }
}
