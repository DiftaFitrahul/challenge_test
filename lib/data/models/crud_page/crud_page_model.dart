class CRUDModel {
  DateTime? date;
  String? name;

  CRUDModel({this.date, this.name});

  Map<String, dynamic> toJson() {
    return {
      'date': date?.toIso8601String(),
      'name': name,
    };
  }

  factory CRUDModel.fromJson(Map<String, dynamic> json) {
    return CRUDModel(
      date: DateTime.parse(json['date']),
      name: json['name'],
    );
  }
}
