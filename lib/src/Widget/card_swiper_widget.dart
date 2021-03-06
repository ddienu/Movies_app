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
      child: SingleChildScrollView(
        child: Swiper(
          itemHeight: _screenSize.height*0.38,
          itemWidth: _screenSize.width*0.5,
          layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context,int index){
              
              peliculas[index].uniqueId;

              return Hero(
                tag: peliculas[index].uniqueId = '${ peliculas[index].id}-tarjeta',
                
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                    onTap: (){
              
                      Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]);
                    },
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/img/no-image.jpg'), 
                      image: NetworkImage(peliculas [index].getPosterImg(),
                      ),
                                ),
                  )
                ),
              );
            },
            itemCount: peliculas.length,
            // pagination: new SwiperPagination(),
            // control: new SwiperControl(),
        ),
      ),
    );
  }
}