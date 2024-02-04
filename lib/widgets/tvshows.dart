import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/widgets/Text.dart';
class Tv_shows extends StatelessWidget {
  final List tvshow;
  const Tv_shows({super.key, required this.tvshow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 275,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text_modifier(text: 'Tv Shows', color: Colors.white, size: 24),
          SizedBox(
            height: 200,
            child: ListView.builder(itemCount: tvshow.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: tvshow[index]['title']?? 'unknown',
                          description: tvshow[index]['overview']?? 'unknown', bannerurl: 'https://image.tmdb.org/t/p/w500/'+(tvshow[index]['poster_path']?? 'unknown'), posturl: 'https://image.tmdb.org/t/p/w500/'+(tvshow[index]['poster_path']?? 'unknown'), vote: tvshow[index]['vote_average']?.toString()?? 'unknown', lanch_on: tvshow[index]['release_date']?? 'unknown')));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5,),
                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500/'+(tvshow[index]['backdrop_path']?? 'pNcwhz3Eyfn3KQ2XykTozbARMpr.jpg')                                 ),fit: BoxFit.cover,

                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5,left: 5,),
                            child:  Center(
                              child: FittedBox (
                                child:Text_modifier(text: tvshow[index]['original_name'] ?? 'title in loading', color: Colors.white, size: 20),
                                fit: BoxFit.cover,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
