import 'package:flutter/material.dart';
import 'package:movies/widgets/Text.dart';
import 'package:movies/widgets/toprated.dart';
import 'package:movies/widgets/trending.dart';
import 'package:movies/widgets/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class  _MyHomePageState extends State<MyHomePage> {
  List trendingmovies=[];
  List tvshow =[];
  List toprated =[];
  final String apikey='17ed21fd7d10eb1177538d11c1341871';
  final String accecctoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxN2VkMjFmZDdkMTBlYjExNzc1MzhkMTFjMTM0MTg3MSIsInN1YiI6IjY1OTc2N2EwYTY5OGNmNTc1ODQzYTAwYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aeZOGMxHTpf0QLZzbhxlDse34CajHpBBWIbHj6g8T-M';

  @override
  void initState(){
    loadmovies();
    super.initState();

  }

  loadmovies() async{
    TMDB tmdbbourzik =TMDB (ApiKeys(apikey,accecctoken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));
    Map trendingresult = await tmdbbourzik.v3.trending.getTrending();
    Map movies = await tmdbbourzik.v3.movies.getTopRated();
    Map tvshows = await tmdbbourzik.v3.tv.getPopular();
    setState(() {
      tvshow= tvshows['results'];
      trendingmovies = trendingresult['results'];
      toprated =movies['results'];
    });
  }
  void _incrementCounter() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(0.5),
        title: const Text_modifier(text: 'Movies and TVshow',color: Colors.white,size: 18,),
      ),
      body: ListView(
        children: [
          Tv_shows(tvshow: tvshow),
          Top_rated(toprated: toprated),
          Trendingapp(trending: trendingmovies),
        ]
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
