import 'package:flutter/material.dart';

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
    

    final listaSugerida = ( query.isEmpty)
                          ? peliculasRecientes
                          : peliculas.where(
                            (p) => p.toLowerCase().startsWith(query.toLowerCase())
                            );

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(peliculasRecientes[i]),
          onTap: (){
          },
        );

      });
  }



}