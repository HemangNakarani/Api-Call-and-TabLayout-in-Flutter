import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'general/first.dart' as first;
import 'general/second.dart' as second;
import 'general/third.dart' as third;



class Api_Call extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return Call_State();
  }
}


class Call_State extends State<Api_Call> with SingleTickerProviderStateMixin
{

  Map data;
  List userData;



  TabController tabController;


  Future getData() async
  {
        http.Response response = await http.get("https://reqres.in/api/users?page=2");
        debugPrint(response.body);
        data = json.decode(response.body);
        setState(() {
            userData = data["data"];
        });
  }


  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this,length: 3);
    getData();
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('API CALL',),
        backgroundColor: Colors.black,
        bottom: TabBar(
          controller: tabController,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.format_paint)),
            Tab(icon: Icon(Icons.favorite)),
            Tab(icon: Icon(Icons.local_airport)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          first.First(),
          second.Second(userData),
          third.Third()
        ],
      ),
    );
  }

}