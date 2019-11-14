import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter_demo/screens/login_screen.dart';

class NewAccount extends StatefulWidget {
  @override
  NewAccountState createState() {
    return new NewAccountState();
  }
}

class NewAccountState extends State<NewAccount> {

  TextStyle style = TextStyle( fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    Widget _buildDropdownItem(Country country) => Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),

        child: Container(
          
          child:CountryPickerUtils.getDefaultFlagImage(country),
//          SizedBox(
//            width: 8.0,
//          ),
//          Text("+${country.phoneCode}(${country.isoCode})"),

        ),
      ),
    );


    final userName = TextField(
      decoration: InputDecoration(hintText: "Username",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),),
    );





    final firstNameLastName = Row(

      children: <Widget>[
        Expanded(

          child: Container(
            padding: EdgeInsets.fromLTRB(0,10,10,10),
            child: TextField(
              decoration: InputDecoration(hintText: "First Name" ,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),

        Expanded(
         child: Container(
           padding: EdgeInsets.fromLTRB(10,10,0,10),
           child: TextField(
              decoration: InputDecoration(hintText: "Last Name",
              enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              ),),
                        ),
            ),
         ),


      ],
    );





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
            decoration: InputDecoration(hintText: "Enter phone number",
              labelStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),),
            keyboardType: TextInputType.number,

          ),
        ),
      ],


    );

    final signUp=FlatButton(
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
        child: Text("SIGN UP",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)));

    final signUpWithGoogle=FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.redAccent),
      ),
      padding: EdgeInsets.all(16),
      onPressed: (){},
      child: Row(
        children: <Widget>[
          Center(

            child: Text("Sign Up with Google",

                textAlign: TextAlign.center,
                style: style.copyWith(

                    color: Colors.black
                    , fontWeight: FontWeight.bold)),
          ),
        ],
      ),);

    final signUpWithFacebook=FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.blue),
      ),
      padding: EdgeInsets.all(16),
      onPressed: (){},

      child: Row(
        children: <Widget>[
          Text("Sign Up with Facebook",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.black
                  , fontWeight: FontWeight.bold)),

        ],
      ),);
    


    final alreadyHaveAccount=Center(child: RichText(
      text: new TextSpan(text: 'Already have an account ? ',style: TextStyle(color: Colors.black45,fontSize: 14) , children: [
        new TextSpan(
          text: 'Log In',style: TextStyle(color: Colors.greenAccent,fontSize: 18),
          recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(context, MaterialPageRoute(builder: (context) => (LogIn())) ),
        )
      ]),
    ),);



    return Scaffold(
      
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
            child: ListView(
              children: <Widget>[
                Text("Sign Up",style: TextStyle(color: Colors.black , fontSize: 24,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 35,
                ),
                userName,

                SizedBox(
                  height: 10,
                ),

                firstNameLastName,
                SizedBox(
                  height: 10,
                ),

                phoneNumber,

                SizedBox(
                  height: 30,
                ),


                signUp,

                SizedBox(
                  height: 30,
                ),


                Center(child: Text("- Or -" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24), )),


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
    );
  }
}
