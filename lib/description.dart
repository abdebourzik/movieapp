import 'package:flutter/material.dart';
import 'package:movies/widgets/Text.dart';




class Description extends StatelessWidget {
  final String name, description,bannerurl,posturl,vote,lanch_on;
  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posturl, required this.vote, required this.lanch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(
            children: [
               Container(
                height: 250,
                child: Stack(
                  children: [
                  Positioned( child:Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(bannerurl,fit: BoxFit.cover,),
                ),),
                    Positioned(child: Text_modifier(text:'⭐Average rating'+vote,color: Colors.white,size: 15,),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                child: Text_modifier(text: name,color: Colors.white,size: 30,),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text_modifier(text: 'release on :'+lanch_on,color: Colors.white,size: 24,),
              ),

               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Container(
                    margin: EdgeInsets.all(5),
                    height: 300,
                    width: 200,
                    child: Image.network(posturl,fit:  BoxFit.cover,),
                  ),
                ],

              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text_modifier(text: description,color: Colors.white,size: 20,),
              ),
            ],
          ),
        ),
         );
  }
}
