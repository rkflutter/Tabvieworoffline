import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dbhelper{

  Future<Database> myinitdata() async {
    //search sqflite copy to
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    //join paths copy in libery add

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table qry fire
          await db.execute(
              'CREATE TABLE contactdata (id INTEGER PRIMARY KEY Autoincrement , work TEXT, dop Text,datetime Text)');
        });
    return database;
  }

  Future<void> insertdata(Database database, String ework, String dop, String newdate) async {
    String qry =
        "insert into contactdata (work,dropdownvalue,datetime)   values('${ework}','${dop}','${newdate}') ";
    int cnt = await database.rawInsert(qry);
    print("cnt");
  }

  Future<List<Map>>viewdatas(Database database) async {

    String qry = "Select * From contactdata";
    List<Map> ll=await database.rawQuery(qry);

    return ll;

  }
}