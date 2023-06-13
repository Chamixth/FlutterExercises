import 'dart:convert';
import '../models/Models.dart';
import 'package:http/http.dart' as http;


   Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/getAll'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
