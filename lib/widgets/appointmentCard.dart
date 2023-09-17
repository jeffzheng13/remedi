import 'package:flutter/material.dart';
import 'package:remedi/data-models/Appointment.dart';

/// Creates an Image block for Intro section
class AppointmentCard extends StatelessWidget {  
  const AppointmentCard({
    super.key,
    required this.appointment,
  });
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color.fromARGB(255, 181, 249, 227)), 
        borderRadius: BorderRadius.circular(5)),
      width: double.infinity, 
      margin: const EdgeInsets.all(5), 
    );
  }
}