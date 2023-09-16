import 'package:realm/realm.dart';

@RealmModel()
class ActionItem {

  late String task;

  late int timesPerDay;

  late int daysBetweenAction;
}