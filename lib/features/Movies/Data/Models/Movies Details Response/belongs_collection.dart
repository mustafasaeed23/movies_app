class BelongsToCollection {
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });
  late final int id;
  late final String name;
  late final String posterPath;
  late final String backdropPath;
  
  BelongsToCollection.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  
}