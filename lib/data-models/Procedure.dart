import 'package:realm/realm.dart';
import 'package:remedi/data-models/ActionItem.dart';
import 'package:remedi/data-models/Appointment.dart';
import 'package:remedi/data-models/Question.dart';

@RealmModel()
class Procedure {
  
  late List<Appointment> appointments;

  late List<ActionItem> actionItems;

  late List<Question> faqs;
}