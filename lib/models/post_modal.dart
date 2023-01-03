// To parse this JSON data, do
//
//     final postModal = postModalFromJson(jsonString);

import 'dart:convert';

List<PostModal> postModalFromJson(String str) => List<PostModal>.from(json.decode(str).map((x) => PostModal.fromJson(x)));

String postModalToJson(List<PostModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModal {
  PostModal({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModal.fromJson(Map<String, dynamic> json) => PostModal(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
