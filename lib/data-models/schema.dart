import 'package:realm/realm.dart';

part 'schema.g.dart';

@RealmModel()
class _User {
  
  late String name;

  late String email;

  late String password;

  late List<_Procedure> history;
}

@RealmModel()
class _Procedure {
  
  late List<_Appointment> appointments;

  late List<_ActionItem> actionItems;

  late List<_Question> faqs;
}

@RealmModel()
class _Appointment {

  late DateTime time;

  late String name;

  late String description;
}

@RealmModel()
class _ActionItem {

  late String task;

  late int timesPerDay;

  late int daysBetweenAction;
}

@RealmModel()
class _Question {

  late String question;

  late String answer;
}