
class UserModel {
  final String? email;
  final String? name;
  final String? lastName;

  UserModel({this.email, this.name, this.lastName});

  String fullName() => '$name $lastName';

}
