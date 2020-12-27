import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app/movie_class.dart';

class Add_Movie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('add new movie'),
          backgroundColor: Colors.blue,
          elevation: 0,

          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {
           //Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDescription()),);
          }),

        ),
        body: addMovie(),
      ),
    );
  }
}

class addMovie extends StatefulWidget{
  @override
  _AddingFormState createState() => _AddingFormState();
}
class _AddingFormState extends State<addMovie> {
  String _Movie_Title, _Movie_Description, _Movie_Seat, _Movie_Time;
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  File file;
  bool uploading = false;

  GlobalKey<FormState> _key = new GlobalKey();
  MovieDatabase Movie_db = MovieDatabase();

  @override
  Widget build(BuildContext context) {

      return SingleChildScrollView(child: Form(
        key: _key,
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.topCenter,

              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                children: <Widget>[

                  Padding(padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
                  RaisedButton(
                    //     disabledColor: Colors.red,
                    // disabledTextColor: Colors.black,
                    padding: const EdgeInsets.all(20),
                    textColor: Colors.white,
                    color: Colors.black,
                    onPressed: () {
                      takeImage(context);
                    },
                    child: Text('choose image', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.movie),
                          labelText: 'movie title',
                          fillColor: Colors.black26),
                      onSaved: (value) {
                        _Movie_Title = value;
                      }

                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    decoration: InputDecoration(icon: Icon(Icons.description),
                        labelText: 'Movie Description'),
                    onSaved: (value) {
                      _Movie_Description = value;
                    },
                  ),
                  TextFormField(
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.access_time),
                          labelText: 'movie time',
                          fillColor: Colors.black26),
                      onSaved: (value) {
                        _Movie_Time = value;
                      }

                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    decoration: InputDecoration(
                        icon: Icon(Icons.event_seat), labelText: 'Movie Seats'),
                    onSaved: (value) {
                      _Movie_Seat = value;
                    },
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      ),
                    ),
                    onPressed: () {
                      uploading ? null : uploadImageAndSaveItemInfo();

                      //Navigator.push(context,MaterialPageRoute(builder: (context) => MovieDescription()),);
                    },
                  ),
                ],
              ),

            )
          ],
        ),
      ),);

}

  takeImage(mContext){
    return  showDialog(
        context: mContext,
        builder: (con)
        {
          return SimpleDialog(
            title: Text("Movie Image",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Capture with Camera",style: TextStyle(color: Colors.black)),
                onPressed: capturePhotoWithCamera,
              ),
              SimpleDialogOption(
                child: Text("Select from Gallery",style: TextStyle(color: Colors.black)),
                onPressed: pickPhotoFromGallery,
              ),
            ],
          );
        }
    );

  }


  capturePhotoWithCamera() async{
    //Navigator.pop(context);
   File imagefile = await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 680.0, maxWidth: 970.0);
    setState(() {
      file = imagefile;
    });
  }
  pickPhotoFromGallery() async{
    //Navigator.pop(context);
    File imagefile = await ImagePicker.pickImage(source: ImageSource.gallery,);
    setState(() {
      file = imagefile;
    });
  }
  uploadImageAndSaveItemInfo() async{

  setState(() {
    uploading = true;
  });
   String imageDownloadURL=await uploaditemimage(file);
   saveiteminfo(imageDownloadURL);
  }
 Future<String> uploaditemimage(mFileImage) async{
    final Reference reference = FirebaseStorage.instance.ref().child("Movies");
    UploadTask uploadTask = reference.child("movie_$productId.jpg").putFile(mFileImage);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
 }
  saveiteminfo(String downloadURL){
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Movie_db.addmovie(Movies(
        Movie_Title: _Movie_Title,
        Movie_Description: _Movie_Description,
          Movie_Time: _Movie_Time,
        Movie_Seat: int.parse(_Movie_Seat),
          Image_URL: downloadURL
      ));
      setState(() {
        file = null;
        uploading = false;
        productId = DateTime.now().millisecondsSinceEpoch.toString();
      });
    }
  }
}

