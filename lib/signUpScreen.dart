import 'package:flutter/material.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpState();
}

class _signUpState extends State<signUpScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey =
        new GlobalKey<FormState>(); //performs validation & creates a form
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    throw UnimplementedError();
  }
}
