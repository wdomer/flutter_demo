
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_demo/screens/login_screen.dart';

import 'package:flutter_demo/screens/new_account_screen.dart';

class GetStart extends StatefulWidget {

  @override
  GetStartState createState() {
    return new GetStartState();
  }
}

class GetStartState extends State<GetStart> {
  TextStyle style = TextStyle( fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final textGetStart = Center(

      child: Text("Let's get started",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
    );

    final alreadyHaveAccount =InkWell(

        onTap: (){},
        child: Center(
          child: Text("Already have an account ?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
        )
    );



    final term=Center(child: RichText(

      textAlign: TextAlign.center,
      text: new TextSpan(text: "By creating an account , you are agreeing  to our ",style: TextStyle(color: Colors.black45,fontSize: 18,height: 1.2) , children: [
        new TextSpan(
          text: 'Term of Service.',style: TextStyle(color: Colors.black,fontSize: 18,),
          recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),

        )
      ]),
    ),);






    final newAccountButon=FlatButton(
      color:Colors.greenAccent ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),

      ),
      padding: EdgeInsets.all(16),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => (NewAccount())),
        );
      },
      child: Text("CREATE NEW ACCOUNT",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)));
    
    final loginButton=FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.greenAccent),
        ),
        padding: EdgeInsets.all(16),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => (LogIn())) ),
        child: Text("LOG IN",
        textAlign: TextAlign.center,
        style: style.copyWith(
            color: Colors.greenAccent
            , fontWeight: FontWeight.bold)),);

    return Scaffold(


      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
            child: ListView(

              children: <Widget>[
                SizedBox(
                  height: 120.0,

                    child: Icon(
                      Icons.home,
                      color: Colors.pink,
                      size: 100.0,

                    ),


                ),
                SizedBox(height: 25.0),
                textGetStart,
                SizedBox(height: 45.0),
                 newAccountButon,

                SizedBox(
                  height: 35.0,
                ),

                alreadyHaveAccount,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 35,
                ),
                term,
              ],
            ),
          ),
        ),
      ),

    );
  }
}
