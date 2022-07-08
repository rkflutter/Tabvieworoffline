import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tabvieworoffline/Dbhelper.dart';

import 'mylogindata.dart';

void main() {
  runApp(MaterialApp(
    home: tavviewdata(),
  ));
}

class tavviewdata extends StatefulWidget {
  const tavviewdata({Key? key}) : super(key: key);

  @override
  State<tavviewdata> createState() => _tavviewdataState();
}

class _tavviewdataState extends State<tavviewdata> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("work"),
              bottom: TabBar(tabs: [
                Tab(
                  child: Text("prosess"),
                ),
                Tab(
                  child: Text("Done"),
                ),
                

              ])),
          body: TabBarView(children: [progress(), Done(),]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return insertdata();
                },
              ));
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}



class progress extends StatefulWidget {
  const progress({Key? key}) : super(key: key);

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  bool check=false;
  Database? db;
  List<Map>ll=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allgetdata();
  }
  void allgetdata() {

    Dbhelper().myinitdata().then((value) {
        setState(() {
          db=value;
        });
        Dbhelper().viewdatas(db!).then((value) {
          ll=value;
        });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        return Container(
          height: 150,
          width: double.infinity-10,
          color: Colors.blueGrey,
          margin: EdgeInsets.all(10),
          child: Column(

            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: check, onChanged: (value) {

                    setState(() {
                      check=value!;
                    });

                  },),
                  Text("work complete",style: TextStyle(fontSize: 20,color: Colors.white)),
                ],
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(


                   child: Text("work",style: TextStyle(color: Colors.white,fontSize: 20
                   )),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(


                   child: Text("work",style: TextStyle(color: Colors.white,fontSize: 20
                   )),
                  ),
                ],
              ),

            ],
          ),
        );
      },),
    );
  }


}



class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
