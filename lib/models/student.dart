class Student{
  final int id;
  final String name;
  final String email;
  final String username;


  Student({this.id, this.name, this.email,this.username});

  String get Name{
    return name;
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
