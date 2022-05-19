class Cast{

List<Actor> actores = [];

Cast.fromJsonList(List<dynamic> jsonList) {

  if (jsonList == null) return;

  jsonList.forEach(( item) { 

    final actor = Actor.fromJsonMap(item);
    actores.add(actor);
  });
}

}


class Actor {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String job;

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.job,
  });

factory Actor.fromJsonMap( Map<String,dynamic> json ){
 
 return Actor( 
   
    adult        : json['adult'],
    gender       : json['gender'],
    id           : json['id'],
    name         : json['name'],
    originalName : json['original_name'],
    popularity   : json['popularity'],
    profilePath  : json['profile_path'],
    castId       : json['cast_id'],
    character    : json['character'],
    creditId     : json['credit_id'],
    order        : json['order'],
    job          : json['job'],);

   

}

getFoto(){

    if ( profilePath == null ){
      return 'https://i.pinimg.com/originals/fc/0c/77/fc0c7762eae4affd716151ef68be93b6.png';
      } else {
        return 'https://image.tmdb.org/t/p/original/$profilePath';
      }
    }

}

