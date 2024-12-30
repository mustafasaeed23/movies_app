class ProductionCountries {
  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });
  late final String iso_3166_1;
  late final String name;
  
  ProductionCountries.fromJson(Map<String, dynamic> json){
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
  }

  
}