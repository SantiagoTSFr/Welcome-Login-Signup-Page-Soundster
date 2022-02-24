
class User {
  final String username;
  final String password;
  User(this.username, this.password);
  factory User.fromJson(Map<String, dynamic> json) {
    return new User(json['username'], json['password']);
  }
}