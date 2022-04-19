import 'package:flutter/material.dart';

import 'package:movies_app/src/Widget/card_swiper_widget.dart';

import 'package:movies_app/src/providers/peliculas_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas(),
          ],
        ),
      )
    );
  }

  _swiperTarjetas() {

    final peliculasProvider = new PeliculasProvider();
    peliculasProvider.getEnCines();
    
    return CardSwiper(
      peliculas: [1,2,3,4,5],
      
      );
  }
}