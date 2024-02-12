class Post {
  int userId, id;
  String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body}); //named parameter

  factory Post.from(dynamic data) {
    return Post(
        userId: data["userId"],
        id: data["id"],
        title: data["title"],
        body: data["body"]);
  }
}

// var post = new Post(userId: 1, id: 1, title: "Title", body: "body");

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import 'Post.dart';

// const API_URL = "https://jsonplaceholder.typicode.com/posts";

// void main() async {
//   var uri = Uri.parse(API_URL);

//   await http.get(uri).then((res) {
//     var decodedData = jsonDecode(res.body) as List;
//     List<Post> posts = decodedData.map((e) => Post.from(e)).toList();
    
//     posts.forEach((p) => print(p.id));
//     // ignore: invalid_return_type_for_catch_error
//   }).catchError((e) => print(e));
// }
