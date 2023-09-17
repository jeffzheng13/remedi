import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:remedi/data-models/ActionItem.dart';
import 'package:remedi/data-models/Procedure.dart';

/// Creates an Image block for Intro section
class ActionItemCard extends StatelessWidget {
  const ActionItemCard({super.key, required this.actionItem});

  final ActionItem actionItem;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.black, fontSize: 16);
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(width: 3, color: Color.fromARGB(255, 181, 249, 227)),
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(5),
      child: ExpandableNotifier(
        initialExpanded: false,
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("${actionItem.title}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          collapsed: Container(),
          expanded: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("Repeat ${actionItem.frequency} times per day", style: style),
          ),
          theme: const ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: true,
            tapBodyToCollapse: true,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: true,
            iconPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          ),
        ),
      ),
    );
  }
}
