import 'package:bloodbankapp1/data/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelp{
  late Database _database;
  Databasehelp(){
    opendb();
  }

  Future<void> opendb() async {
    _database=await  openDatabase(
      join(await getDatabasesPath(),"User.db"),
      version: 1,
      onCreate: (Database db,int version){
        db.execute('CREATE TABLE usertable(Id INTEGER PRIMARY KEY AUTOINCREMENT,Name TEXT,Phonenumber TEXT,Age INTEGER,weight INTEGER,bloodgroup TEXT,gender TEXT)');
        db.execute('CREATE TABLE donation_request (Id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,location TEXT');
      }
    );
  }
  Future<int> insertuser(User user) async {
    await opendb();
    print('insertion');
    return await _database.insert('usertable', user.toMap());
  }
 Future<int>update(User user) async {
    await opendb();
    return await _database.update('usertable', user.toMap(),
    where: 'Id=?',whereArgs: [user.Id]
    );
  }
  Future<int>deleteuser(User user) async {
    await opendb();
    return await _database.delete('usertable',
      where: 'Id=?',whereArgs: [user.Id]);
  }
  Future<List<User>?>getall()async{
    await opendb();
    List<Map<String,dynamic>> map=await _database.query("usertable");//to fetch all data
    return List.generate(map.length, (index){//by refering to index we can return object[index refers to the value of map which keep itirrating]
      return User(Id:map[index]['Id'].toString(),Name:map[index]['Name'], Phonenumber: map[index]['Phonenumber'], Age: map[index]['Age'].toString(), weight: map[index]['weight'].toString(), bloodgroup: map[index]['bloodgroup'],gender: map[index]['gender']);
    });
  }
  Future<int>insertdonationrequest(Donationrequest request) async {
    await opendb();
    return await _database.insert('donation_request', request.toMap());
  }

}