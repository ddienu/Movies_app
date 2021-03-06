import 'package:flutter/material.dart';

import '../models/actores_model.dart';
import 'package:movies_app/src/models/pelicula_model.dart';

import 'package:movies_app/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {


    final Pelicula pelicula = ModalRoute.of(context)?.settings.arguments as Pelicula;

    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar (pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0 ),
                _posterTitulo( context, pelicula ),
                _descripcion( pelicula ),
                _crearCasting ( pelicula ),
              ]
            ),
            )
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
          image: NetworkImage(pelicula.getBackgroundImg()),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
          ),
      ),

    );
  }
  
  _posterTitulo(BuildContext context, Pelicula pelicula) {

    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20.0 ),
      child: Row(
        children: [
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular( 20.0 ),
              child: Image(
                image: NetworkImage( pelicula.getPosterImg()),
                height: 150.0,
                ),
            ),
          ),
          SizedBox( width: 20.0 ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( pelicula.title, style: Theme.of(context).textTheme.bodyText1, overflow: TextOverflow.ellipsis, ),
                Text( pelicula.originalTitle, style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis, ),
                Row(
                  children: [
                    Icon(Icons.star_outlined),
                    Text( pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.bodyText2 ),
                  ],
                )
              ],
            )
            )
        ],
      ),

    );
  }
  
  _descripcion(Pelicula pelicula) {
    
    return Container(

      padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        ),

    );
  }
  
  _crearCasting(Pelicula pelicula) {

    final peliProvider = PeliculasProvider();

    FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if (snapshot.hasData){
          return _crearActoresPageView(snapshot.data);
        } else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  
  _crearActoresPageView(List<Actor> actores) {


    return SizedBox(
      height: 20.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        itemCount: actores.length,
        itemBuilder: ( context, i ) => _actorTarjeta(actores[i]),
        ),
      );
  }

  _actorTarjeta ( Actor actor){
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'), 
              image: NetworkImage( actor.getFoto()), 
              height: 150.0,
              fit: BoxFit.cover,
              ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}