import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:remedi/data-models/Procedure.dart';
import 'package:remedi/pages/auth.dart';
import 'package:remedi/data-models/User.dart' as u;

import '../data-models/ActionItem.dart';
import '../data-models/Appointment.dart';
import '../data-models/Question.dart';

u.User? getUser(String uid) {
    CollectionReference<Map<String, dynamic>> db = FirebaseFirestore.instance.collection("PatientInfo");
    db.doc(uid).get().then((DocumentSnapshot docSnap) {
      if (docSnap.exists) {
        Map<String, dynamic> data = (docSnap.data() as Map<String, dynamic>);
        ;
        List<Procedure> procedures = getProcedures(data["Procedures"]);
        u.User user = u.User(
            first_name: data["first_name"],
            last_name: data["last_name"],
            email: data["email"],
            pmh: procedures);
        return user;
      }
    });
    return null;
  }

  List<Procedure> getProcedures(List<Map<String, dynamic>> data) {
    List<Procedure> procedures = [];

    for (Map<String, dynamic> procedure in data) {
      List<ActionItem> actionItems = getActionItems(procedure["action_items"]);
      List<Question> faqs = getFAQs(procedure["FAQs"]);
      List<Appointment> appointments = getAppointments(procedure["appointments"]);
      Procedure p = Procedure(name: procedure["name"], summary: procedure["summary"], warnings: procedure["dont_do"], actionItems: actionItems, faqs: faqs, appointments: appointments)
      procedures.add(p);
    }
    return procedures;
  }

  List<ActionItem> getActionItems(List<Map<String, dynamic>> data) {
    List<ActionItem> actionItems = [];

    for (Map<String, dynamic> actionItem in data){
      DateTime? dateStart = actionItem["date_start"].toDate();
      DateTime? dateEnd = actionItem["date_end"].toDate();
      ActionItem a = ActionItem(title: actionItem["title"], frequency: actionItem["frequency"], dateStart: dateStart, dateEnd: dateEnd);
      actionItems.add(a);
    }
    return actionItems;
  }

  List<Question> getFAQs(List<Map<String, dynamic>> data) {
    List<Question> faqs = [];

    for (Map<String, dynamic> faq in data){
      Question q = Question(answer: faq["question"], question: faq["answer"]);
      faqs.add(q);
    }
    return faqs;
  }

  List<Appointment> getAppointments(List<Map<String, dynamic>> data) {
    List<Appointment> appointments = [];

    for (Map<String, dynamic> appt in data){
      DateTime date = appt["appt_dateTime"].toDate();
      Appointment a = Appointment(date: date, description: appt["appt_description"], name: appt["appt_name"])
      appointments.add(a);
    }
    return appointments;
  }
