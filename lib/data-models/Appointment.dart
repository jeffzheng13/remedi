import 'package:realm/realm.dart';

@RealmModel()
class Appointment {

  late DateTime time;

  late String name;

  late String description;
}