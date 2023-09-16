import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data-models/Procedure.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.procedure});
  final Procedure procedure;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(207, 227, 227, 227),
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Column(
          children: [
            Row(children: [
              Text("Your recent procedure", style: GoogleFonts.mooli(fontSize: 12, color: Color.fromARGB(255, 63, 131, 65))), 
              IconButton(icon: const Icon(Icons.arrow_right), onPressed: () { },)
            ]),
            Expanded(
              child: Text(procedure.summary,)
            ),
          ]
        ),
      ));
  
  }
}