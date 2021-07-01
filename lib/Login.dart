import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/MCQ_1.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1E6FF),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextFormField(
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.blue,
                        ),
                        hintText: "Username",
                        border: InputBorder.none,
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Provide an email';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1E6FF),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: TextFormField(
                      validator: (input) {
                        if (input.length < 6) {
                          return 'Longer password please';
                        } else if (input.length >= 10 &&
                            !input.contains(RegExp(r'\W')) &&
                            RegExp(r'\d+\w*\d+').hasMatch(input)) {
                          return 'please enter special characters';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 20,
                          color: Colors.blue,
                        ),
                        hintText: "Password",
                        // hintStyle: kChecklistTextLight,
                        border: InputBorder.none,
                      ),
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 30,
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: FlatButton(
                      child: Text(
                        " LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 14),
                      ),
                      onPressed: () async {
                        await signIn();
                      },
                    ),
                  ),
                  // TextButton(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Don’t have an Account ?",
                  //         // style: kChecklistTextLight.copyWith(
                  //         //   color: Color(0xFF287EF8),
                  //         // ),
                  //       ),
                  //       Text(
                  //         " Sign Up",
                  //         // style: kChecklistTextLight.copyWith(
                  //         //   color: Color(0xFF287EF8),
                  //         //   fontWeight: FontWeights.extraBold,
                  //         // ),
                  //       ),
                  //     ],
                  //   ),
                  //   onPressed: () {
                  //     // Get.to(SignUp());
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult authResult = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password));
        print(authResult.user.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => quiz1(
                      user: authResult.user,
                    )));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
