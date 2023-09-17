import 'package:flutter/material.dart';
import 'package:remedi/data-models/ActionItem.dart';

/// Creates an Image block for Intro section
class ActionItemCard extends StatelessWidget {  
  const ActionItemCard({
    super.key,
    required this.actionItem
  });

  final ActionItem actionItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color.fromARGB(255, 181, 249, 227)), 
        borderRadius: BorderRadius.circular(5)),
      width: double.infinity, 
      margin: const EdgeInsets.all(5), 
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text("${actionItem.task}"),
        const VerticalDivider(indent: 5, endIndent: 5),
        Text("Repeat ${actionItem.timesPerDay}x"),
        const VerticalDivider(indent: 5, endIndent: 5),
        Text("Every ${actionItem.daysBetweenAction} day(s)"),
      ])
    );
  }
}