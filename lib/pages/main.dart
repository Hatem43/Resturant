import 'package:flutter/material.dart';
import 'registeration page.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CinemaPage(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => LoginScreen(),
        "Signup": (BuildContext context) => SignupScreen(),
        "Home": (BuildContext context) => Homepage()),
      },
    );
  }
}

class CinemaPage extends StatefulWidget {
  final Cinema cinema;
  CinemaPage(this.cinema);
  @override
  _CinemaPageState createState() => _CinemaPageState(this.cinema);
}

class _CinemaPageState extends State<CinemaPage> {
  final Cinema cinema;
  _CinemaPageState(this.cinema);
  Movie selectedMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 3.0,
        title: Text('${cinema.name}'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(cinema.imageLink), fit: BoxFit.fill)),
        child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 10),
                        child: Text(
                          'Explore...',
                          style:
                          TextStyle(color: Colors.white, fontSize: 26),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int index = 0;
                            index < cinema.moviesAvailable.length;
                            index++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedMovie = cinema.moviesAvailable[index];
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 10, left: 10),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        cinema.moviesAvailable[index].imageLink,
                                        width:
                                        MediaQuery.of(context).size.width / 2 -
                                            50,
                                        height:
                                        MediaQuery.of(context).size.height / 4,
                                        fit: BoxFit.fill,
                                      ),
                                      Text(
                                        cinema.moviesAvailable[index].name,
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      selectedMovie != null
                          ? Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5)),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Text(selectedMovie.name,style: TextStyle(color: Colors.white,fontSize: 22),),
                              IconButton(onPressed: (){
                                setState(() {
                                  selectedMovie = null;
                                });
                              },icon: Icon(Icons.cancel,color: Colors.redAccent[400],),)
                            ],),
                            Text(selectedMovie.story,style: TextStyle(color: Colors.white,fontSize: 18,height: 1.2),),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => BookingFilmPage(selectedMovie)));
                              },
                              color: Colors.blue,
                              child: Text('Book A Ticket',style: TextStyle(color: Colors.white,fontSize: 18),),
                            )
                          ],
                        ),
                      )
                          : SizedBox()
                    ]),
              ),
            )),
      ),
    );
  }
}
class Cinema{
  String name;
  String imageLink;
  String rating;
  List<Movie> moviesAvailable;
  Cinema(this.name,this.imageLink,this.rating,this.moviesAvailable);
}
class Movie{
  String name;
  String story;
  String imageLink;
  Movie(this.name,this.story,this.imageLink);
}
class CinemasPage extends StatefulWidget {
  @override
  _CinemasPageState createState() => _CinemasPageState();
}
class DataFaker {
  int numberOfNotification = 3;
  List<Cinema> cinemas;
  DataFaker._privateConstructor();

  static final DataFaker _instance = DataFaker._privateConstructor();

  factory DataFaker() {
    return _instance;
  }

  fakeCinemas() {
    cinemas = [
      new Cinema('Cinema House', 'images/cinema0.jpg', '⭐⭐⭐', [
        Movie(
            'Avengers',
            'Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). The film was directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, and features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse the damage caused by Thanos in Infinity War.',
            'images/movie0.jpg'),
        Movie(
            'Moon Light',
            'Moonlight is set in the impoverished Liberty City area of Miami, shown in brilliant, luminous colours, and takes place in three acts. In the first act, successful drug dealer Juan (played by Mahershala Ali) sees a young boy fleeing a group of boys threatening to beat him and follows the child into an abandoned apartment, into which he has locked himself for protection. The child (Alex Hibbert) refuses to speak but allows Juan to buy him a meal. Juan and his girlfriend, Teresa (Janelle Monáe), take him into their home, where the boy says that his name is Chiron and that he is called Little, but he refuses to say where he lives until the following morning. Juan returns him to his mother (Naomie Harris), a user of crack cocaine who is emotionally abusive to the child. Juan and Teresa become an alternate family for Chiron, who does not know how to fit in with the other boys in the neighbourhood, though a friend, Kevin (Jaden Piner), tries to teach him.',
            'images/movie1.jpg'),
      ]),
      new Cinema('IMAX', 'images/cinema1.jpg', '⭐⭐⭐⭐', [
        Movie(
            'Avengers',
            'Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). The film was directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, and features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse the damage caused by Thanos in Infinity War.',
            'images/movie0.jpg'),
        Movie(
            'Moon Light',
            'Moonlight is set in the impoverished Liberty City area of Miami, shown in brilliant, luminous colours, and takes place in three acts. In the first act, successful drug dealer Juan (played by Mahershala Ali) sees a young boy fleeing a group of boys threatening to beat him and follows the child into an abandoned apartment, into which he has locked himself for protection. The child (Alex Hibbert) refuses to speak but allows Juan to buy him a meal. Juan and his girlfriend, Teresa (Janelle Monáe), take him into their home, where the boy says that his name is Chiron and that he is called Little, but he refuses to say where he lives until the following morning. Juan returns him to his mother (Naomie Harris), a user of crack cocaine who is emotionally abusive to the child. Juan and Teresa become an alternate family for Chiron, who does not know how to fit in with the other boys in the neighbourhood, though a friend, Kevin (Jaden Piner), tries to teach him.',
            'images/movie1.jpg'),
        Movie(
            'Joker',
            'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
            'images/movie2.jpg'),
      ]),
      new Cinema('Century Cinema', 'images/cinema3.jpg', '⭐⭐', [
        Movie(
            'Avengers',
            'Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). The film was directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, and features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse the damage caused by Thanos in Infinity War.',
            'images/movie0.jpg'),
        Movie(
            'Moon Light',
            'Moonlight is set in the impoverished Liberty City area of Miami, shown in brilliant, luminous colours, and takes place in three acts. In the first act, successful drug dealer Juan (played by Mahershala Ali) sees a young boy fleeing a group of boys threatening to beat him and follows the child into an abandoned apartment, into which he has locked himself for protection. The child (Alex Hibbert) refuses to speak but allows Juan to buy him a meal. Juan and his girlfriend, Teresa (Janelle Monáe), take him into their home, where the boy says that his name is Chiron and that he is called Little, but he refuses to say where he lives until the following morning. Juan returns him to his mother (Naomie Harris), a user of crack cocaine who is emotionally abusive to the child. Juan and Teresa become an alternate family for Chiron, who does not know how to fit in with the other boys in the neighbourhood, though a friend, Kevin (Jaden Piner), tries to teach him.',
            'images/movie1.jpg'),
        Movie(
            'Joker',
            'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
            'images/movie2.jpg'),
        Movie(
            'Drive',
            ' mysterious Hollywood stuntman and mechanic moonlights as a getaway driver and finds himself in trouble when he helps out his neighbor in this action drama.',
            'images/movie3.jpg'),
      ]),
      new Cinema('VOX', 'images/cinema4.jpg', '⭐⭐⭐⭐⭐', [
        Movie(
            'Avengers',
            'Avengers: Endgame is a 2019 American superhero film based on the Marvel Comics superhero team the Avengers, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the direct sequel to Avengers: Infinity War (2018) and the 22nd film in the Marvel Cinematic Universe (MCU). The film was directed by Anthony and Joe Russo and written by Christopher Markus and Stephen McFeely, and features an ensemble cast including Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, Jeremy Renner, Don Cheadle, Paul Rudd, Brie Larson, Karen Gillan, Danai Gurira, Benedict Wong, Jon Favreau, Bradley Cooper, Gwyneth Paltrow, and Josh Brolin. In the film, the surviving members of the Avengers and their allies attempt to reverse the damage caused by Thanos in Infinity War.',
            'images/movie0.jpg'),
        Movie(
            'Moon Light',
            'Moonlight is set in the impoverished Liberty City area of Miami, shown in brilliant, luminous colours, and takes place in three acts. In the first act, successful drug dealer Juan (played by Mahershala Ali) sees a young boy fleeing a group of boys threatening to beat him and follows the child into an abandoned apartment, into which he has locked himself for protection. The child (Alex Hibbert) refuses to speak but allows Juan to buy him a meal. Juan and his girlfriend, Teresa (Janelle Monáe), take him into their home, where the boy says that his name is Chiron and that he is called Little, but he refuses to say where he lives until the following morning. Juan returns him to his mother (Naomie Harris), a user of crack cocaine who is emotionally abusive to the child. Juan and Teresa become an alternate family for Chiron, who does not know how to fit in with the other boys in the neighbourhood, though a friend, Kevin (Jaden Piner), tries to teach him.',
            'images/movie1.jpg'),
        Movie(
            'Joker',
            'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
            'images/movie2.jpg'),
        Movie(
            'Beauty & Beast',
            'A selfish Prince is cursed to become a monster for the rest of his life, unless he learns to fall in love with a beautiful young woman he keeps prisoner.',
            'images/movie4.jpg'),
      ]),
    ];
  }

}

class _CinemasPageState extends State<CinemasPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  DataFaker dataFaker = new DataFaker();
  List<Cinema> cinemas = new List<Cinema>();
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    cinemas = dataFaker.cinemas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[] +
                  cinemas.map((cinema) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CinemaPage(cinema)));
                        },
                        child: FadeTransition(
                          opacity: animation,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(cinema.imageLink),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 15.0,
                                      offset: Offset(0.0, 3))
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, bottom: 10, left: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  cinema.rating,
                                  style: TextStyle(
                                      color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ));
                  }).toList() +
                  [
                    GestureDetector(
                      onTap: () {},
                      child: FadeTransition(
                        opacity: animation,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black),
                          child: Padding(
                            padding:
                            EdgeInsets.only(top: 10.0, bottom: 5, left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Show More \n',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      height: 0.5),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.forward,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: null)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
        ));
  }
}

class CinemaSeat extends StatefulWidget {
  bool isReserved;

  bool isSelected;

  CinemaSeat({this.isSelected = false, this.isReserved = false});

  @override
  _CinemaSeatState createState() => _CinemaSeatState();
}

class _CinemaSeatState extends State<CinemaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.amber
                  : widget.isReserved ? Colors.white : null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.white, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}

class BookingFilmPage extends StatefulWidget {
  Movie selectedMovie;
  BookingFilmPage(this.selectedMovie);
  @override
  _BookingFilmPageState createState() =>
      _BookingFilmPageState(this.selectedMovie);
}

class _BookingFilmPageState extends State<BookingFilmPage> {
  Movie selectedMovie;
  int selectedDate;
  int selectedSlot;
  String selectedType = '2D';
  List<String> types = ['2D', '3D'];
  List<bool> chosenType = [true, false];
  _BookingFilmPageState(this.selectedMovie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMovie.name),
          centerTitle: true,
          backgroundColor: Colors.black87,
          elevation: 0.0,
        ),
        body: Container(
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black87),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int index = 0; index < 8; index++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate =
                                    index; //ToDo: Would be dateId, or Date not index
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  color: selectedDate == index
                                      ? Colors.amber
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 5, left: 5),
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 5, left: 5),
                              child: Column(
                                children: [
                                  Text(
                                    DateTime.now()
                                        .add(Duration(days: index)).day.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: selectedDate == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  Text(DateTime.now()
                                        .add(Duration(days: index)).year.toString()
                                        .substring(0, 3)
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                        color: selectedDate == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),

                ///Slots
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int index = 2; index < 24; index += 2)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSlot =
                                    index; //ToDo: Would be dateId, or Date not index
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedSlot == index
                                          ? Colors.amber
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 5, left: 5),
                              margin: EdgeInsets.only(
                                  top: 10, bottom: 10, right: 5, left: 5),
                              child: Column(
                                children: [
                                  Text(
                                    '22:00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: selectedSlot == index
                                            ? Colors.amber
                                            : Colors.white),
                                  ),
                                  Text(
                                    '${index * 10}\$',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                        color: selectedDate == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                ToggleButtons(
                  color: Colors.white.withOpacity(0.5),
                  selectedColor: Colors.amber,
                  splashColor: Colors.green,
                  fillColor: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderColor: Colors.white,
                  selectedBorderColor: Colors.amber,
                  children: List.generate(
                      types.length, (index) => Text(types[index].toString())),
                  isSelected: chosenType,
                  onPressed: (index) {
                    setState(() {
                      chosenType = List.filled(2, false);
                      chosenType[index] = true;
                    });
                  },
                ),
                Center(
                    child: Image.asset(
                      'assets/images/screen.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    )),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      // First Seat Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 5.5),
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width /20),
                          ),
                          CinemaSeat(
                            isReserved: true,
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 10),
                          ),
                        ],
                      ),
                      // Second Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(
                            isReserved: true,
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                        ],
                      ),
                      // Third  Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(),
                          CinemaSeat(
                            isReserved: true,
                          ),
                          CinemaSeat(
                            isReserved: true,
                          ),
                        ],
                      ),
                      // 4TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(
                            isReserved: true,
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                        ],
                      ),
                      // 5TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                        ],
                      ),
                      // 6TH Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                        ],
                      ),
                      // final Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                          CinemaSeat(),
                          CinemaSeat(),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Pay 30\$',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.red,
                    ),
                  ),
                )
              ]),
            )));
  }
}
