import 'dart:convert';

List<Notifications> notificationsFromMap(String str) =>
    List<Notifications>.from(
        json.decode(str).map((x) => Notifications.fromMap(x)));

String notificationsToMap(List<Notifications> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Notifications {
  Notifications({
  required  this.id,
   required this.title,
   required this.message,
  });

  String id;
  String title;
  String message;

  factory Notifications.fromMap(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
      };
}
