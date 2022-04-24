import 'package:flutter/material.dart';

import 'package:movies_app/src/Widget/card_swiper_widget.dart';

import 'package:movies_app/src/providers/peliculas_provider.dart';

import 'package:movies_app/src/Widget/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Películas en cine'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon (Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _swiperTarjetas(),
        _footer(context),
      ],
      )
   );
  }

  _swiperTarjetas() {


    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {


        if ( snapshot.hasData ){

        return CardSwiper( peliculas: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              )
            );
        } 
      },
    );
  }

  _footer(context) {

    return Container(
      
      width: double.infinity,
      child: Column(
        children: [
          Text('Películas populares', style: Theme.of(context).textTheme.subtitle1,),

          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData){
                return MovieHorizontal( peliculas: snapshot.data);
                              
              } else {
                return CircularProgressIndicator();
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}