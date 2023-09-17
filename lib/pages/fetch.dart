import 'package:flutter/material.dart';
import 'package:remedi/pages/auth.dart';

class fetch extends StatefulWidget {
  fetch({super.key});

  @override
  State<fetch> createState() => _fetchState();
}

class _fetchState extends State<fetch> {
  final _auth = AuthService();

  @override
  void initState() {
    super.initState();
  }

  void async getActionItems() {

  }

  void async getFAQ() {

  }

  void async getAppts() {
    
  }

  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
