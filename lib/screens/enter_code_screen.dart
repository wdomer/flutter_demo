import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:flutter_demo/screens/account_verified_screen.dart';


class EnterCode extends StatefulWidget {
  @override
  _EnterCodeState createState() => _EnterCodeState();
}

class _EnterCodeState extends State<EnterCode> {

  TextStyle style = TextStyle(fontSize: 20.0);
  bool isEnable;

  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;

  bool hasError = false;
  String errorMessage;


  bool _isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {

    final pinTextfield=PinCodeTextField(
      autofocus: false,
      controller: controller,
      hideCharacter: false,
      highlight: true,
      highlightColor: Colors.grey,
      defaultBorderColor: Colors.black,
      hasTextBorderColor: Colors.green,
      maxLength: pinLength,
      hasError: hasError,
      pinBoxWidth: 50 ,
      //maskCharacter: "*",

      onTextChanged: (text) {
        setState(() {
          hasError = false;
         // isEnable=true;
        });
      },
      onDone: (text){
        setState(() {
          _isButtonDisabled=false;
        });
      },

      pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
      wrapAlignment: WrapAlignment.start,
      pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
      pinTextStyle: TextStyle(fontSize: 30.0),
      pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
      pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
    );

    final continueButton = FlatButton(
      color: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),

      ),
      padding: EdgeInsets.all(20),

      onPressed: _isButtonDisabled ? null:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>(AccountVerified())));
      }
      ,
      child: Text("CONTINUE",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );

    return Container(
      child:Center(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
              child: ListView(
                children: <Widget>[

                  SizedBox(
                    height: 50,
                  ),

                  Center(
                      child: Text(
                        "Enter Code",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  Center(
                      child: Text(
                        "We sent SMS with your code",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  Center(
                      child: Text(
                        "to +249123456789 ",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      )),

                  SizedBox(
                    height: 30,
                  ),

                  pinTextfield,

                  SizedBox(
                    height: 30,
                  ),

                  continueButton,

                  SizedBox(
                    height: 30,
                  ),

                  Center(
                      child: Text(
                        "I didn't get code",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.greenAccent),
                      )),



                ],
              ),
            ),
          ),
        ),
      ),
    );


  }


}

