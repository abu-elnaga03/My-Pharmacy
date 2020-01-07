import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilits.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  FocusNode _confirmPassFocusNode = FocusNode();
  String _name, _email, _password, _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Screen size;

  bool loading=false;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Stack(children: <Widget>[
          ClipPath(
              clipper: BottomShapeClipper(),
              child: Container(
                color: Colors.red,
              )),
          SingleChildScrollView(
            child: SafeArea(
              top: true,
              bottom: false,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.getWidthPx(20),
                    vertical: size.getWidthPx(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                            ),
                            onPressed: () => Navigator.pop(context, false),
                          ),
                          SizedBox(width: size.getWidthPx(10)),
                          _signUpGradientText(),
                        ],
                      ),
                      SizedBox(height: size.getWidthPx(10)),
                      _textAccount(),
                      SizedBox(height: size.getWidthPx(30)),
                      registerFields()
                    ]),
              ),
            ),
          )
        ]));
  }

  RichText _textAccount() {
    return RichText(
      text: TextSpan(
          text: "Hae you registed already? ",
          children: [
            TextSpan(
              style: TextStyle(color: Colors.deepOrange),
              text: 'Login here',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pop(context),
            )
          ],
          style: TextStyle(
              fontFamily: 'Exo2', color: Colors.black87, fontSize: 16)),
    );
  }

  GradientText _signUpGradientText() {
    return GradientText('Register',
        gradient: LinearGradient(
            colors: [Color.fromRGBO(97, 6, 165, 1.0), Colors.red]),
        style: TextStyle(
            fontFamily: 'Exo2', fontSize: 36, fontWeight: FontWeight.bold));
  }

  BoxField _nameWidget() {
    return BoxField(
        controller: _nameController,
        focusNode: _nameFocusNode,
        hintText: "Enter Name",
        lableText: "Name",
        obscureText: false,
        onSaved: (String val) {
          _name = val;
        },
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_emailFocusNode);
        },
        icon: Icons.person,
        iconColor: Colors.red);
  }

  BoxField _emailWidget() {
    return BoxField(
        controller: _emailController,
        focusNode: _emailFocusNode,
        hintText: "Enter email",
        lableText: "Email",
        obscureText: false,
        onSaved: (String val) {
          _email = val;
        },
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passFocusNode);
        },
        icon: Icons.email,
        iconColor: Colors.red);
  }

  BoxField _passwordWidget() {
    return BoxField(
        controller: _passwordController,
        focusNode: _passFocusNode,
        hintText: "Enter Password",
        lableText: "Password",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          _password = val;
        },
        iconColor: Colors.red);
  }

  BoxField _confirmPasswordWidget() {
    return BoxField(
        controller: _confirmPasswordController,
        focusNode: _confirmPassFocusNode,
        hintText: "Enter Confirm Password",
        lableText: "Confirm Password",
        obscureText: true,
        icon: Icons.lock_outline,
        onSaved: (String val) {
          _confirmPassword = val;
        },
        iconColor: Colors.red);
  }

  BoxField _addressWidget() {
    return BoxField(
        controller: _locationController,
        focusNode: _confirmPassFocusNode,
        hintText: "Enter Address",
        lableText: "Address",
        icon: Icons.location_on,
        onSaved: (String val) {
          _confirmPassword = val;
        },
        iconColor: Colors.red);
  }

  BoxField _phoneNumberWidget() {
    return BoxField(
        controller: _phoneController,
        focusNode: _confirmPassFocusNode,
        hintText: "Enter Phone Number",
        lableText: "Phone Number",
        icon: Icons.phone,
        onSaved: (String val) {
          _confirmPassword = val;
        },
        iconColor: Colors.red);
  }

  Widget _signUpButtonWidget() {
    return loading? Center(child: CircularProgressIndicator()):Container(
      padding: EdgeInsets.symmetric(
          vertical: size.getWidthPx(20), horizontal: size.getWidthPx(16)),
      width: size.getWidthPx(200),
      child: RaisedButton(
        elevation: 8.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: EdgeInsets.all(size.getWidthPx(12)),
        child: Text(
          "Sign Up",
          style: TextStyle(
              fontFamily: 'Exo2', color: Colors.white, fontSize: 20.0),
        ),
        color: Colors.red,
        onPressed: () async {
          setState(() {
            loading=true;
          });
          FirebaseAuth auth = FirebaseAuth.instance;
          if (_emailController.text.isEmpty ||
              _nameController.text.isEmpty ||
              _confirmPasswordController.text.isEmpty ||
              _passwordController.text.isEmpty ||
              _locationController.text.isEmpty ||
              _phoneController.text.isEmpty) {
            showDialog<AlertDialog>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Validation Error'),
                    content:
                        Center(child: Text('Completa all the Feilds, please!')),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK!'))
                    ],
                  );
                });
            setState(() {
              loading = false;
            });
            return;
          }
          if (_passwordController.text != _confirmPasswordController.text) {
            showDialog<AlertDialog>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Validation Error'),
                    content: Center(
                        child: Text(
                            'Password feild and confirm feild must be matched, please!')),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK!'))
                    ],
                  );
                });
            setState(() {
              loading = false;
            });
            return;
          }
          FirebaseUser user = (await auth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text))
              .user;
          if (user == null) {
            showDialog<AlertDialog>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text('Authentiaction Failed'),
                    content: Text(
                            'A Problem has been occured, Try Again later!'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK!'))
                    ],
                  );
                });
            setState(() {
              loading = false;
            });
            return;
          }
          Firestore.instance.collection('users').document(user.uid).setData({
            'name': _nameController.text,
            'address': _locationController,
            'phone': _phoneController.text,
          });
          setState(() {
            loading=false;
          });
          showDialog<AlertDialog>(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text('Authentiaction Succeeded'),
                  content: Text('You have been authorized successfully.'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK!'))
                  ],
                );
              });
          Future.delayed(Duration(seconds: 5)).then((_) {
            Navigator.pushNamed(context, '/login');
          });
        },
      ),
    );
  }

  GestureDetector socialCircleAvatar(String assetIcon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: size.getWidthPx(20),
        backgroundColor: Colors.white,
        child: Image.asset(assetIcon),
      ),
    );
  }

  registerFields() => Container(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _nameWidget(),
                _emailWidget(),
                _passwordWidget(),
                _confirmPasswordWidget(),
                _addressWidget(),
                _phoneNumberWidget(),
                _signUpButtonWidget(),
              ],
            )),
      );
}
