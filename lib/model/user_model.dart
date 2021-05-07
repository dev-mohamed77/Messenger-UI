import 'package:flutter/widgets.dart';

class UserModel {
  final int id;
  final String name;
  final String images;
  final String messege;
  final bool active;
  final String time;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.images,
    @required this.messege,
    @required this.active,
    @required this.time,
  });
}
