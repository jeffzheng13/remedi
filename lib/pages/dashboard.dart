import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:remedi/data-models/schema.dart' as datamodels;

class Dashboard extends StatefulWidget {
  Dashboard({
      super.key,
      required this.procedure
  });
  final datamodels.Procedure procedure;
  final realm = Realm(Configuration.local([datamodels.User.schema]));
  
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
