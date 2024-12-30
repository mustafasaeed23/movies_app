class Genres {
  Genres({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  
  Genres.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }


}