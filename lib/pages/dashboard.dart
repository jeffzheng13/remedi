import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remedi/widgets/summary.dart';
import '../data-models/User.dart';
import '../data-models/Procedure.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
      super.key,
      required this.user,
      required this.recentProcedure
  });
  final User user;
  final Procedure recentProcedure;
  
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RichText(
            text: TextSpan(text: "Hello, ${widget.user.name}", style: GoogleFonts.mooli(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 75, 217, 79)))),
        ),
        Summary(procedure: widget.recentProcedure)

      ])
    );
  }
}
