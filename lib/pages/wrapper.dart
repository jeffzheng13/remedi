import 'package:remedi/pages/dashboard.dart';
import 'package:remedi/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/pages/fetch.dart';
import 'package:remedi/pages/loginScreen.dart';

// ignore: camel_case_types
class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    //return either HomeScreen or MyTrackPage
    if (user == null) {
      return loginScreen();
    } else {
      return Dashboard(user: getUser(user.uid));
    }
  }
}
