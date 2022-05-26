import 'package:flutter/material.dart';
import 'package:movies_app/src/providers/peliculas_provider.dart';

import '../models/pelicula_model.dart';

final peliculasProvider = new PeliculasProvider();

final peliculas = [
  'Batman'
  'Sonic 2'
  'Dr Strange'
  'Maverick'
  'Jurassic World'
];

final peliculasRecientes = [
  'Batman'
  'Sonic 2'
];


class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: (() {
          query: '';
        }), 
        icon: Icon( Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: (() {
        close(context, Null);
      }), 
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu, 
        progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty)
    return Container();

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot){

        if (snapshot.hasData){

          final peliculas = snapshot.data;

          return ListView(
            children: peliculas!.map( (pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context, null,);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
              }).toList()
          );

        } else {
          return Center(
            child: CircularProgressIndicator()
            );
        }

      });


  }



}