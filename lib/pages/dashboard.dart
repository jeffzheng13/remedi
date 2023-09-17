import 'package:flutter/material.dart';
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
                  height: 180,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: 200,
                      child: Text(
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
              Container(
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 1.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 181, 249, 227),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: double.infinity,
                      child: ExpandableNotifier(
                        initialExpanded: false,
                        child: ExpandablePanel(
                          header: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Text('Your recent procedure',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                          ),
                          collapsed: Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          expanded: const Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: Text(
                                  'Information about the procedure\nDon\'t run walk sit ok?',
                                ),
                              ),
                            ],
                          ),
                          theme: const ExpandableThemeData(
                            tapHeaderToExpand: true,
                            tapBodyToExpand: false,
                            tapBodyToCollapse: false,
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            hasIcon: true,
                            iconPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional(-1.00, 1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 10, 20),
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
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Container(
                          width: double.infinity,
                          height: 440,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                                child: PageView(
                                  controller: PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [Container(height: 100, color: Colors.red),Container(height: 100, color: Color.fromARGB(255, 50, 35, 135)),Container(height: 100, color: Colors.red),Container(height: 100, color: Color.fromARGB(255, 50, 35, 135)),Container(height: 100, color: Colors.red),Container(height: 100, color: Color.fromARGB(255, 50, 35, 135))],
                                      ),
                                    ),
                                    ListView(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.00, 1.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 16),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: PageController(initialPage: 0),
                                    count: 2,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await PageController().animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: const smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 3,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 8,
                                      dotColor: Colors.black,
                                      activeDotColor: Colors.black,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: const Icon(Icons.home), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.history), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.settings), onPressed: () {})
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
