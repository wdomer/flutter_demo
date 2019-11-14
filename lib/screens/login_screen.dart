import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/new_account_screen.dart';

import 'package:flutter_demo/screens/enter_code_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextStyle style = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    Widget _buildDropdownItem(Country country) => Container(

            child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CountryPickerUtils.getDefaultFlagImage(country),
        ));


    final phoneNumber = Row(
      children: <Widget>[

        CountryPickerDropdown(
          initialValue: 'sd',
          itemBuilder: _buildDropdownItem,
          onValuePicked: (Country country) {
            print("${country.name}");
          },
        ),


        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter phone number",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],


    );

    final loginButton = FlatButton(
      color: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),

      ),
      padding: EdgeInsets.all(16),
      onPressed: ()=>  Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => (EnterCode()))),
      child: Text("LOG IN",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final signUpWithGoogle = FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.redAccent),
      ),
      padding: EdgeInsets.all(16),
      onPressed: () {},
      child: Text("Sign Up with Google",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
    );

    final signUpWithFacebook = FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.blue),
      ),
      padding: EdgeInsets.all(16),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Sign Up with Facebook",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );

    final alreadyHaveAccount = Center(
      child: RichText(
        text: new TextSpan(
            text: "Don't have an account ? ",
            style: TextStyle(color: Colors.black45, fontSize: 14),
            children: [
              new TextSpan(
                text: 'Creat an Account',
                style: TextStyle(color: Colors.greenAccent, fontSize: 18),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (NewAccount()))),
              )
            ]),
      ),
    );

    return Container(
      child: Scaffold(

        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36, 60, 36, 36),
              child: ListView(
                children: <Widget>[
                  Container(
                      child: Text(
                        "Welcome Back,",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                      child: Text(
                        "Sign in to continue",
                        style: TextStyle( fontSize: 20,color: Colors.grey),
                      )),

                  SizedBox(
                    height: 30,
                  ),
                  phoneNumber,
                  SizedBox(
                    height: 20,
                  ),
                  loginButton,
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    "___ Or ___",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  signUpWithGoogle,
                  SizedBox(
                    height: 30,
                  ),
                  signUpWithFacebook,
                  SizedBox(
                    height: 30,
                  ),
                  alreadyHaveAccount,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
