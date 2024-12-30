class ProductionCompanies {
  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
  late final int id;
  late final String logoPath;
  late final String name;
  late final String originCountry;
  
  ProductionCompanies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  
}