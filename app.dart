import 'dart:convert';

import 'package:http/http.dart' as http;

import 'User.dart';

const USER_API = "https://randomuser.me/api/?results=5";

void main() async {
  var uri = Uri.parse(USER_API);

  await http.get(uri).then((res) {
    var decodedData = jsonDecode(res.body)["results"];
    List<dynamic> lisy = decodedData as List;
    List<User> users = lisy.map(((e) => User.from(e))).toList();

    users.forEach((user) {
      print(user.picture.thumbnail);
    });
  }).catchError((e) => print(e));
}
