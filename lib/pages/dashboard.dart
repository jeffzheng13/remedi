import 'package:flutter/material.dart';
import 'package:remedi/data-models/ActionItem.dart';
import 'package:remedi/data-models/Question.dart';
import 'package:remedi/widgets/actionItemCard.dart';
import 'package:remedi/widgets/faqCard.dart';
import 'package:table_calendar/table_calendar.dart';
import '../data-models/User.dart';
import '../data-models/Procedure.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(
      {super.key, required this.user, required this.recentProcedure});
  final User? user;
  final Procedure? recentProcedure;

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE5D4CE), Color(0xFF49C496)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.00, 1.00),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: 200,
                      child: const Text(
                        'Hello, John',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: Color.fromARGB(255, 181, 249, 227)),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(5)),
                    margin: const EdgeInsets.all(5),
                    child: ExpandableNotifier(
                        initialExpanded: false,
                        child: ExpandablePanel(
                          header: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Your recent procedure",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          collapsed: Container(),
                          expanded: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Summary", style: TextStyle(color: Colors.black)),
                          ),
                          theme: const ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: true,
                            tapBodyToCollapse: true,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                            iconPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Day & Appointments',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: PageView(
                      controller: PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ListView(
                          children: [
                            ActionItemCard(
                                actionItem: ActionItem(
                                    task: "Take pill",
                                    timesPerDay: 2,
                                    daysBetweenAction: 1)),
                            ActionItemCard(
                                actionItem: ActionItem(
                                    task: "Take pill",
                                    timesPerDay: 2,
                                    daysBetweenAction: 1)),
                            ActionItemCard(
                                actionItem: ActionItem(
                                    task: "Take pill",
                                    timesPerDay: 2,
                                    daysBetweenAction: 1)),
                            ActionItemCard(
                                actionItem: ActionItem(
                                    task: "Take pill",
                                    timesPerDay: 2,
                                    daysBetweenAction: 1)),
                            ActionItemCard(
                                actionItem: ActionItem(
                                    task: "Take pill",
                                    timesPerDay: 2,
                                    daysBetweenAction: 1))
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromARGB(255, 181, 249, 227)),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.all(5),
                          child: TableCalendar(
                              rowHeight: 45,
                              calendarStyle: CalendarStyle(
                                  defaultTextStyle:
                                      TextStyle(color: Colors.black)),
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: DateTime.now(),
                              eventLoader: (day) {
                                return [];
                              }),
                        ),
                        ListView(
                          children: [
                            FAQCard(
                                faq: Question(
                                    question: "Question 1", answer: "Answer")),
                            FAQCard(
                                faq: Question(
                                    question: "Question 2", answer: "Answer")),
                            FAQCard(
                                faq: Question(
                                    question: "Question 3", answer: "Answer")),
                            FAQCard(
                                faq: Question(
                                    question: "Question 4", answer: "Answer")),
                          ],
                        )
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.history), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.settings), onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
