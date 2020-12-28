import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebooking/database.dart';
import 'package:flutter/material.dart';
import 'package:ebooking/add_movie.dart';

MovieDatabase db = MovieDatabase();
class MovieList extends StatefulWidget{
  @override
  _MovieListState createState()  => new _MovieListState();

}
class _MovieListState extends State<MovieList>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.black,

        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Movies").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return MovieListView(documents: snapshot.data.docs);
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colors.black,
            onPressed: () { Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_Movie()),
            );}

        ),
      ),
    );
  }}
class MovieListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  MovieListView({this.documents});
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount:  documents.length,
          padding: EdgeInsets.only(top: 12.0),
          itemBuilder: (context , position){
            return Column(

              children: <Widget>[
                Divider(height: 6.0,),

                Column(
                  children: <Widget>[
                    Divider(height: 6.0,color: Colors.black26,thickness:1.0 ,),

                    Image.network('${ documents[position].data()['image url']}',width: 250,height: 250,),
                    ListTile(
                      title: Text(
                        ' ${ documents[position].data()['title']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),
                        textAlign: TextAlign.center,
                      ) ,


                      subtitle: Text(
                        'description : ${ documents[position].data()['description']}  ' + "\n"
                            'seats : ${ documents[position].data()['seats']}' + "\n"
                        , style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.0,
                      ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),

                        RaisedButton(
                          color: Colors.black,
                          child: Text(
                            'delete',
                            style:TextStyle(
                                color: Colors.white,
                                fontSize: 20.0
                            ),
                          ),
                          onPressed:(){
                            db.deletemovie(documents[position].id);
                          },
                        ) ,
                      ],
                    ),
                  ],
                ),
              ],);

          }
      ),);
  }
}
