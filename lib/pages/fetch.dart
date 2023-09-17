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

DateTime defaultTime = DateTime(0,0,0,0);
u.User defaultUser = u.User(
  first_name: "Paul",
  last_name: "Bunyan",
  email: "pbunyan@gmail.com",
  pmh: [
    Procedure(
      faqs: [
        Question(question: "One of the most frequently asked questions is...", answer: "Here is a very useful answer for you."),
        Question(question: "Another pretty pressing question that makes you stress.", answer: "Answer to relieve your anxiety that you are on the road to recovery.")
      ],
      actionItems: [
        ActionItem(dateEnd: defaultTime, dateStart: defaultTime, frequency: 2, title: "Brush your teeth."),
        ActionItem(dateEnd: defaultTime, dateStart: defaultTime, frequency: 2, title: "Floss your gums."),
      ],
      appointments: [],
      warnings: [
        "Don't eat candy.",
        "Don't eat hard foods.",
        "Don't eat hot foods"
      ],
      name: "Procedure Name",
      summary: "This is the procedure summary."
    ),
    Procedure(
      faqs: [
        Question(question: "One of the most frequently asked questions is...", answer: "Here is a very useful answer for you."),
        Question(question: "Another pretty pressing question that makes you stress.", answer: "Answer to relieve your anxiety that you are on the road to recovery.")
      ],
      actionItems: [
        ActionItem(dateEnd: defaultTime, dateStart: defaultTime, frequency: 4, title: "Acetaminophen - 2 500mg tablets"),
        ActionItem(dateEnd: defaultTime, dateStart: defaultTime, frequency: 1, title: "Enoxaparin - 40mg"),
        ActionItem(dateEnd: defaultTime, dateStart: defaultTime, frequency: 4, title: "Cephalexin - 500mg"),
      ],
      appointments: [],
      warnings: [
      ],
      name: "Hemiarthroplasty",
      summary: "Jane Doe underwent a left hip hemiarthroplasty procedure. Dr. John Smith performed a surgical intervention to replace the damaged hip joint with a prosthetic implant."
    ),
  ]
);

u.User? getUser(String uid) {
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection("PatientInfo");
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
  return defaultUser;
}

List<Procedure> getProcedures(List<Map<String, dynamic>> data) {
  List<Procedure> procedures = [];

  for (Map<String, dynamic> procedure in data) {
    List<ActionItem> actionItems = getActionItems(procedure["action_items"]);
    List<Question> faqs = getFAQs(procedure["FAQs"]);
    List<Appointment> appointments = getAppointments(procedure["appointments"]);
    Procedure p = Procedure(
        name: procedure["name"],
        summary: procedure["summary"],
        warnings: procedure["dont_do"],
        actionItems: actionItems,
        faqs: faqs,
        appointments: appointments);
    procedures.add(p);
  }
  return procedures;
}

List<ActionItem> getActionItems(List<Map<String, dynamic>> data) {
  List<ActionItem> actionItems = [];

  for (Map<String, dynamic> actionItem in data) {
    DateTime? dateStart = actionItem["date_start"].toDate();
    DateTime? dateEnd = actionItem["date_end"].toDate();
    ActionItem a = ActionItem(
        title: actionItem["title"],
        frequency: actionItem["frequency"],
        dateStart: dateStart,
        dateEnd: dateEnd);
    actionItems.add(a);
  }
  return actionItems;
}

List<Question> getFAQs(List<Map<String, dynamic>> data) {
  List<Question> faqs = [];

  for (Map<String, dynamic> faq in data) {
    Question q = Question(answer: faq["question"], question: faq["answer"]);
    faqs.add(q);
  }
  return faqs;
}

List<Appointment> getAppointments(List<Map<String, dynamic>> data) {
  List<Appointment> appointments = [];

  for (Map<String, dynamic> appt in data) {
    DateTime date = appt["appt_dateTime"].toDate();
    Appointment a = Appointment(
        date: date,
        description: appt["appt_description"],
        name: appt["appt_name"]);
    appointments.add(a);
  }
  return appointments;
}
