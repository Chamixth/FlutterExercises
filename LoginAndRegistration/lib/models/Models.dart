import 'dart:convert';
import 'package:http/http.dart' as http;
class User {
   final String userName;
   final String email;
   final String password;

  const User({
    required this.userName,
    required this.email,
    required this.password
});
  factory User.fromJson(Map<String, dynamic>json){
    return User(userName: json['username'], email: json['email'], password: json['password']);
  }


}