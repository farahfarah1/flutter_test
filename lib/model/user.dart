class User {
  int? id;
  String? email;
  String? phone;
  String? name;
  User(
      {required this.id,
      required this.email,
      required this.phone,
      required this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['name'] = name;
    return data;
  }
}
