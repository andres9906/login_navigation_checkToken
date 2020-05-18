class Professor{
  final int id;
  final String name;
  final String email;
  final String username;
  final int course_id;
  final String city;
  final String country;
  final String phone;
  final String birthday;


  Professor({this.id, this.name, this.email,this.username, this.birthday, this.city, this.country, this.course_id, this.phone});

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

  factory Professor.fromJson2(Map<String, dynamic> json) {
    return Professor(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      course_id: json['course_id'],
      city: json['city'],
      country: json['country'],
      birthday: json['birthday'],
      phone: json['phone'],
    );
  }
}
