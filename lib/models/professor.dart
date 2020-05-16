class Professor{
  final int id;
  final String name;
  final String email;
  final String username;


  Professor({this.id, this.name, this.email,this.username});

  String get Name{
    return name;
  }

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
