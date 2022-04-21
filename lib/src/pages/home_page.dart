import 'package:flutter/material.dart';

import 'package:movies_app/src/Widget/card_swiper_widget.dart';

import 'package:movies_app/src/providers/peliculas_provider.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          _swiperTarjetas(),
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
}