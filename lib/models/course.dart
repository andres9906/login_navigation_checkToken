class Course{
  final int id;
  final String name;
  final String professor;
  final int students;

  Course({this.id,this.name,this.professor,this.students});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      professor: json['professor'],
      students: json['students'],
    );
  }
}
