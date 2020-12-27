import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/movie_class.dart';
class MovieDatabase {

  addmovie(Movies movie) {
    FirebaseFirestore.instance.collection("Movies").add({
      'title': movie.Movie_Title,
      'description': movie.Movie_Description,
      'seats': movie.Movie_Seat,
      'image url' : movie.Image_URL,
      'time' : movie.Movie_Time
    });
  }

  deletemovie(docId) {
    FirebaseFirestore.instance.collection("Movies").doc(docId).delete();
  }
}