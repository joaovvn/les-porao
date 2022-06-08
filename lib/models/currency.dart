import 'dart:convert';

class Currency {
  String? name;
  double? sell;

  Currency(this.name, this.sell);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sell': sell,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      map['name'],
      map['sell']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source));
}
