import 'Appointment.dart';
import 'ActionItem.dart';
import 'Question.dart';

class Procedure {
  final String name;
  final String summary;
  final List<String> warnings;
  final List<Appointment> appointments;
  final List<ActionItem> actionItems;
  final List<Question> faqs;

  Procedure({required this.summary, required this.warnings, required this.name, required this.appointments, required this.actionItems, required this.faqs});
}