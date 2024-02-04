import 'package:flutter/material.dart';
import 'package:movies/description.dart';
import 'package:movies/widgets/Text.dart';
class Top_rated extends StatelessWidget {
  final List toprated;
  const Top_rated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text_modifier(text: 'Top Rated Movies', color: Colors.white, size: 24),
          SizedBox(
            height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(name: toprated[index]['title']?? 'unknown',
    description: toprated[index]['overview']?? 'unknown', bannerurl: 'https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path']?? 'unknown', posturl: 'https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path']?? 'unknown', vote: toprated[index]['vote_average'].toString()?? 'unknown', lanch_on: toprated[index]['release_date']?? 'unknown')));
                    },
                    child: Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 190 ,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/'+toprated[index]['poster_path'],
                                  ),fit: BoxFit.cover,

                                )
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5,left: 5,),
                            child: Center( child: Text_modifier(text: toprated[index]['title'] ?? 'unknown', color: Colors.white, size: 15),),
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
