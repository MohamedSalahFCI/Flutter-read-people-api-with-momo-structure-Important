import 'package:read_people_api_with_momo_structure/properties.dart';

class ReadPeople {
  final int count;
  final String next;
  final int previous;
  final List<Properties> results;

  ReadPeople({this.count, this.next, this.previous, this.results});

  factory ReadPeople.fromJson(Map<String, dynamic> json) {
    return new ReadPeople(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List).map((e) => Properties.fromJson(e)).toList(),
    );
  }
}
