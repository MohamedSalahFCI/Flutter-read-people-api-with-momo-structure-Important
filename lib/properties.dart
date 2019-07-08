class Properties {
  final String name;
  final String height;
  final String mass;
  final String hair_color;
  final String skin_color;
  final String eye_color;
  final String birth_year;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicels;
  final List<String> starships;
  final String created;
  final String edited;
  final String url;

  Properties(
      {this.name,
      this.height,
      this.mass,
      this.hair_color,
      this.skin_color,
      this.eye_color,
      this.birth_year,
      this.gender,
      this.homeworld,
      this.films,
      this.species,
      this.vehicels,
      this.starships,
      this.created,
      this.edited,
      this.url});

  factory Properties.fromJson(Map<String, dynamic> json) {
    return new Properties(
        name: json['name'],
        height: json['height'],
        mass: json['mass'],
        hair_color: json['hair_color'],
        skin_color: json['eye_color'],
        eye_color: json['eye_color'],
        birth_year: json['birth_year'],
        gender: json['gender'],
        homeworld: json['homeworld'],
        films: (json['films'] as List).cast<String>().toList(),
        species: (json['species'] as List).cast<String>().toList(),
        vehicels: (json['vehicles'] as List).cast<String>().toList(),
        starships: (json['starships'] as List).cast<String>().toList(),
        created: json['created'],
        edited: json['edited'],
        url: json['url']);
  }
}
