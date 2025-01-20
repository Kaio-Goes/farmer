class User {
  late String id;
  late String name;
  late String email;
  late String register;
  late String property;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.register,
      required this.property});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json['email'];
    register = json['register'];
    property = json['property'];
  }
}
