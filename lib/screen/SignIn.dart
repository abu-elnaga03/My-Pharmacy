import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() {
    // TODO: implement createState
    return SignInState();
  }
}

class SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24),
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signInImage.jpg'),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xfff5f5f5),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RaisedButton(
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });
                            FirebaseAuth auth = FirebaseAuth.instance;
                            FirebaseUser user;
                            try {
                              user = (await auth.signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text))
                                  .user;
                              print(user.uid);
                            } catch (e) {
                              print(e.message);
                              showDialog<AlertDialog>(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text('Authentication Failed'),
                                        content: Text(
                                            'A Problem has been occured while you login!\n${e.message}'),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: Text('OK!'))
                                        ],
                                      ));
                              return;
                            } finally {
                              setState(() {
                                _loading = false;
                              });
                            }
                            await showDialog<AlertDialog>(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => AlertDialog(
                                      elevation: 24,
                                      title: Text('Authentication Successed'),
                                      content:
                                            Text(
                                                'You have logged in Successfully!\nWelcome To My Pharmacy'),
                                      actions: <Widget>[
                                        FlatButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text('Let\'s Go'))
                                      ],
                                    ));
                            Navigator.of(context).pushNamed('/home');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: <Color>[
                                    Colors.red[300],
                                    Colors.red[600],
                                    Colors.red[800],
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0, minHeight: 50),
                              // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'SIGN IN!',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 34),
                    child: Row(
                      children: <Widget>[
                        Text("Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.pink,
                                fontSize: 15,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
