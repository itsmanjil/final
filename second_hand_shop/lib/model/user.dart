class User {
  String? email;
  String? name;
  String? phone;
  String? password;

  User({
    this.email,
    this.name,
    this.phone,
    this.password,
  });
// get the data from the server
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        password: json["password"],
      );
// send the data of json object
  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "phone": phone,
        "password": password,
      };
}
