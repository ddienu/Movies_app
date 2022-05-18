import 'package:flutter/material.dart';
import 'package:movies_app/src/models/pelicula_model.dart';


class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Pelicula pelicula = ModalRoute as Pelicula;

    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar (pelicula),
        ],
      )
    );
  }
  
  _crearAppBar(Pelicula pelicula) {

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'), 
          image: NetworkImage(pelicula.backdropPath),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
          ),
      ),

    );
  }
}