class User {
  String id;
  final String name;
  final String LC;
  final int room;

  User(
      {this.id = '', required this.name, required this.LC, required this.room});

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'LC': LC, 'room': room};

  static User fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], LC: json['LC'], room: json['room']);
}
