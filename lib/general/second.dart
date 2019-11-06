import 'package:flutter/material.dart';

class Second extends StatefulWidget
{

  final List userData;
  Second(this.userData);

  @override
  State<StatefulWidget> createState() {

    return  _SecondState(userData);;
  }

}

class _SecondState extends State<Second>
{

  List userData;
    _SecondState(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getListView(),
    );
  }

  ListView getListView()
  {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: userData==null ? 0 : userData.length,
      itemBuilder: (BuildContext context,int index)
      {
        return Card(
          child:
          Padding(
              padding: EdgeInsets.all(10.0),
              child:Column(
                children: <Widget>[

                  CircleAvatar(
                    backgroundImage: NetworkImage(userData[index]["avatar"]),
                  ),

                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700 ),)),

                  Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text("${userData[index]["email"]}",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w500 ),)),

                ],
              )),
        );
      },
    );
  }

}