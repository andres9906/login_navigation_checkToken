class User{
  final String token;
  final String username;
  final String name;

  User({this.token, this.username, this.name});

  String get Name{
    return name;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      username: json['username'],
      name: json['name'],
    );
  }
}
