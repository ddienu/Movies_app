import 'package:flutter/material.dart';
import 'package:movies_app/src/models/pelicula_model.dart';


class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key? key}) : super(key: key);

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
          ClipRRect(
            borderRadius: BorderRadius.circular( 20.0 ),
            child: Image(
              image: NetworkImage( pelicula.getPosterImg()),
              height: 150.0,
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
}