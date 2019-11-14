import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/upload_profile_photo_screen.dart';

class AccountVerified extends StatefulWidget {
  @override
  _AccountVerifiedState createState() => _AccountVerifiedState();
}

class _AccountVerifiedState extends State<AccountVerified> {

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UploadProfilePhoto()));
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  "Account Verified",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )),
                SizedBox(
                  height: 60,
                ),
                Container(

                  decoration: BoxDecoration(
                   // color: Colors.greenAccent,

                  //  borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.circle ,
                    border: Border.all(color: Colors.greenAccent,width: 2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.done,size: 60,color: Colors.greenAccent,),
                  ),
                )
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}
