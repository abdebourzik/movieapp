import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/widgets/Text.dart';
class Trendingapp extends StatelessWidget {
  final List trending;
  const Trendingapp({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),

      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text_modifier(text: 'Trending Movies', color: Colors.white, size: 24),
          SizedBox(
            height: 270,
            child: ListView.builder(itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: trending[index]['title']?? 'unknown',
                      description: trending[index]['overview']?? 'unknown', bannerurl: 'https://image.tmdb.org/t/p/w500/'+trending[index]['poster_path'], posturl: 'https://image.tmdb.org/t/p/w500/'+trending[index]['poster_path'], vote: trending[index]['vote_average'].toString(), lanch_on: trending[index]['release_date']?? 'unknown')));
                },
                child: Container(
                  width: 150,
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5,),
                        height: 190 ,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/'+trending[index]['poster_path'],
                            ),fit: BoxFit.cover,

                          )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5,left: 5,),
                        child: Center  (
                           child :Text_modifier(text: trending[index]['title'] ?? 'title in loading', color: Colors.white, size: 15),
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
