import 'package:realm/realm.dart';
import 'package:remedi/data-models/Procedure.dart';

@RealmModel()
class User {
  
  late String name;

  late String email;

  late String password;

  late List<Procedure> history;
}