import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tabvieworoffline/Dbhelper.dart';

import 'main.dart';

class insertdata extends StatefulWidget {
  const insertdata({Key? key}) : super(key: key);

  @override
  State<insertdata> createState() => _insertdataState();
}

class _insertdataState extends State<insertdata> {
  TextEditingController work=TextEditingController();
  String dropdownvalue = 'defult';
  var items = [
  'defult',
  'shopping',
  'cart',

  ];
  DateTime now = DateTime.now();
  String  datetime ="";

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydatastor();
  }
  void mydatastor() {
    Dbhelper().myinitdata().then((value)  {
  setState(() {
    db = value;
  });
});
     datetime = DateTime.now().toString();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              child: TextField(
                controller: work,
                decoration: InputDecoration(
                    labelText: "Enter work",

                    hintText: "Enter your work",
                    border: OutlineInputBorder()),

              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 180,
              child: Text("${datetime}"),
            ),
            SizedBox(height: 20,),
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  String ework = work.text;
                  String dop=dropdownvalue;
                  String newdate=datetime;


                  Dbhelper().insertdata(db!,ework,dop,newdate);

                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return tavviewdata();

                    },
                    ));
                  });
                  print("..work====.${ework}");
                  print("..work====.${dop}");
                  print("..work====.${newdate}");
                },

                child: Text("SUBMIT"))
          ],
        ),
      ),
    );
  }


}
