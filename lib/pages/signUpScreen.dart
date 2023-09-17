import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi/pages/auth.dart';
import 'package:remedi/pages/loading_animation.dart';
import 'package:remedi/pages/loginScreen.dart';
import 'package:ionicons/ionicons.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpState();
}

class _signUpState extends State<signUpScreen> {
  final _formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool loading = false;
  AuthService _auth = AuthService();
  String firstName = '';
  String lastName = '';
  String _error = '';
  String _password = '';
  String _email = '';

  final kHintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );

  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  final kBoxDecorationStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _firstNameController,
            validator: (val) => val == null || val.isEmpty
                ? 'First name cannot be empty.'
                : null,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your first name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (value) => firstName = value,
            controller: _lastNameController,
            validator: (val) => val == null || val.isEmpty
                ? 'Last name cannot be empty.'
                : null,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your first name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _emailController,
            validator: (val) => val == null ||
                    val.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val)
                ? 'Please enter valid email.'
                : null,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (value) => _password = value,
            controller: _passwordController,
            validator: (val) =>
                val == null || val.isEmpty ? 'Enter valid password' : null,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: OutlinedButton(
        //elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            setState(() {
              loading = true;
            });

            dynamic result = await _auth.registerWithEmailAndPassword(
                firstName, lastName, _email, _password);
            if (result == null) {
              setState(() {
                _error =
                    'Failed to register with your email and password. Please try again.';
                loading = false;
              });
            } else {
              setState(() {
                loading = false;
              });
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => loginScreen())));
            }
          }
        },
        //padding: EdgeInsets.all(15.0),
        //shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(30.0),
        //),
        //color: Colors.white,
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign up with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  //   return GestureDetector(
  //     onTap: null,
  //     child: Container(
  //       height: 60.0,
  //       width: 60.0,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: Offset(0, 2),
  //             blurRadius: 6.0,
  //           ),
  //         ],
  //         image: DecorationImage(
  //           image: logo,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              onPressed: () => _auth.googleSignIn().whenComplete(() =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => loginScreen())))),
              icon: Icon(
                Ionicons.logo_google,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => loginScreen()))),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget errorMsg() {
    return Text(
      _error,
      style: TextStyle(color: Colors.red, fontSize: 13),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE0D2C7), Color(0xFF44B09E)],
                    stops: [0.1, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        _buildFirstNameTF(),
                        SizedBox(height: 20.0),
                        _buildLastNameTF(),
                        SizedBox(height: 20.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTF(),
                        loading ? Loading() : _buildSignUpBtn(),
                        _buildSignUpWithText(),
                        _buildSocialBtnRow(),
                        _buildSignInBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
