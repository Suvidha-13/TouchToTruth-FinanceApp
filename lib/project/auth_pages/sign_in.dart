import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home.dart';

class SignIn extends StatelessWidget {
  // Future<String?>? _authenticateUsers(LoginData data) {
  //   print('authenticate users');
  //   return Future.delayed(Duration(seconds: 1)).then((_) => null);
  // }

  Future<String?>? _authenticateUsers(LoginData data) {
    print('authenticate users');
    return Future.delayed(Duration(seconds: 1)).then((_) => null);
  }

  Future<String?>? _onRecoverPassword(String name) {
    print('onRecoverPassword');
    return Future.delayed(Duration(seconds: 1)).then((_) => null);
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      title: 'Touch2Truth',
      logo: AssetImage('assets/images/logo.png'),
      // onSignup: _authenticateUsers,
      onLogin: _authenticateUsers,
      onRecoverPassword: _onRecoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      messages: LoginMessages(
        userHint: 'Email',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm Password',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot Password?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription: 'Recover Password',
        recoverPasswordSuccess: 'Password recovered successfully',
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          // label: 'Google',
          callback: () async {
            print('start google sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          // label: 'Facebook',
          callback: () async {
            print('start facebook sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            print('start linkedin sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop linkedin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            print('start github sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop github sign in');
            return null;
          },
        ),
      ],
      theme: LoginTheme(
        primaryColor: Colors.lightBlue.shade50,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.blue.shade900,
          fontFamily: 'Ariel',
          letterSpacing: 2,
        ),
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          color: Colors.orange,
          shadows: [Shadow(color: Colors.red.shade800, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.lightBlue.shade100,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.black87,
          ),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.purple,
          backgroundColor: Colors.lightBlue.shade800,
          highlightColor: Colors.blue,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../classes/textinput_decoration.dart';
// import 'loading_page.dart';
//
// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();
//   final _formKey = GlobalKey<FormState>();
//   String error = '';
//   bool loading = false;
//
//   // text field state
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : Scaffold(
//             backgroundColor: Colors.brown[100],
//             appBar: AppBar(
//               backgroundColor: Colors.brown[400],
//               elevation: 0.0,
//               title: Text('Sign in to Brew Crew'),
//               actions: <Widget>[
//                 FlatButton.icon(
//                   icon: Icon(Icons.person),
//                   label: Text('Register'),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             body: Container(
//               padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(height: 20.0),
//                     TextFormField(
//                       decoration:
//                           textInputDecoration.copyWith(hintText: 'email'),
//                       validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                       onChanged: (val) {
//                         setState(() => email = val);
//                       },
//                     ),
//                     SizedBox(height: 20.0),
//                     TextFormField(
//                       obscureText: true,
//                       decoration:
//                           textInputDecoration.copyWith(hintText: 'password'),
//                       validator: (val) => val.length < 6
//                           ? 'Enter a password 6+ chars long'
//                           : null,
//                       onChanged: (val) {
//                         setState(() => password = val);
//                       },
//                     ),
//                     SizedBox(height: 20.0),
//                     RaisedButton(
//                         color: Colors.pink[400],
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         onPressed: () async {
//                           if (_formKey.currentState.validate()) {
//                             setState(() => loading = true);
//                             dynamic result = await _auth
//                                 .signInWithEmailAndPassword(email, password);
//                             if (result == null) {
//                               setState(() {
//                                 loading = false;
//                                 error =
//                                     'Could not sign in with those credentials';
//                               });
//                             } else {
//                               Navigator.pop(context);
//                             }
//                           }
//                         }),
//                     SizedBox(height: 12.0),
//                     Text(
//                       error,
//                       style: TextStyle(color: Colors.red, fontSize: 14.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }
// }
