import 'package:flutter_project_may2023/Storage/hive2/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveDb{
  // creation of singleton class
  HiveDb._internal();

  static HiveDb instance = HiveDb._internal();  // single instance creation
  //factory constructor to access instance
  factory HiveDb(){  //HiveDb.instance
    return instance;
  }

  Future<List<User>>getUser() async{
    final db = await Hive.openBox<User>("userData");
    return db.values.toList();
  }

 Future<void> addUser(User user) async {
    final db = await Hive.openBox<User>("userData");
    db.put(user.id,user);
 }

}

