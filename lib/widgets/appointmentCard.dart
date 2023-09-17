import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:remedi/data-models/Appointment.dart';
import 'package:table_calendar/table_calendar.dart';

/// Creates an Image block for Intro section
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.black, fontSize: 16);
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      eventLoader: (day) {
        return [];
      }
    );
  }
}
