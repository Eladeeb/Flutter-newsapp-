import 'package:flutter/material.dart';
import 'package:fluttertest/Shared_ui/Navigation_Drawer.dart';
import 'Home_Tabs/POPULAR.dart';
import 'Home_Tabs/FAVOURTS.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeadLine News "),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
          IconButton(icon: Icon(Icons.more_vert),onPressed: (){},)

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
              Favourites(),
              Popular(),
              Favourites(),
            ],controller: _tabController,

          )
      ),
    );
  }
}
