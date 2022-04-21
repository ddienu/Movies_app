import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:movies_app/src/models/pelicula_model.dart'; 

class CardSwiper extends StatelessWidget {
  
  final List<Pelicula> peliculas;

  CardSwiper({ required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;


    return Container(
      padding: EdgeInsets.only( top: 10.0 ),
      child: Swiper(
        layout: SwiperLayout.STACK,
         itemWidth: _screenSize.width,
         itemHeight: _screenSize.height,
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/no-image.jpg'), 
                image: NetworkImage(peliculas [index].getPosterImg(),
                ),
            )
            );
          },
          itemCount: peliculas.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
      ),
    );
  }
}