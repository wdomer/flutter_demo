import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';



class UploadProfilePhoto extends StatefulWidget {
  @override
  _UploadProfilePhotoState createState() => _UploadProfilePhotoState();
}

class _UploadProfilePhotoState extends State<UploadProfilePhoto> {

  File _image;


  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }



  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontSize: 20.0);
    return Container(

      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 36),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                      "Hi! Ibrahim ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                      "Upload Profile Photo ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: getImage,
                  child: Container(

                    decoration: BoxDecoration(
                       color: Colors.grey,

                      //  borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.circle ,
                        border: Border.all(color: Colors.greenAccent,width: 1,style: BorderStyle.solid)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                      _image == null
                          ? Icon(Icons.person,size: 80,color: Colors.white,)
                          : Image.file(_image),

                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Center(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.file_upload),
                        Text(
                          "Drag & drop to upload ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    )),
           FlatButton(
          color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),

        ),
        padding: EdgeInsets.all(20),
        onPressed: (){},
//            Navigator.push(context,
//            MaterialPageRoute(builder: (context) => (EnterCode()))),
        child: Text("CONTINUE",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),

      ],
            ),
          ),
        ),
      ),

    );
  }
}

