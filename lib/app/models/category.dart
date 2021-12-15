import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});
}

final List<Category> categories = [
  Category(1, "General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(2, "Books", icon: FontAwesomeIcons.bookOpen),
  Category(3, "Film", icon: FontAwesomeIcons.video),
  Category(4, "Music", icon: FontAwesomeIcons.music),
  Category(5, "Television", icon: FontAwesomeIcons.tv),
  Category(6, "Video Games", icon: FontAwesomeIcons.gamepad),
  Category(7, "Science & Nature", icon: FontAwesomeIcons.microscope),
  Category(8, "Computer", icon: FontAwesomeIcons.laptopCode),
  Category(9, "Maths", icon: FontAwesomeIcons.sortNumericDown),
  Category(10, "Mythology", icon: FontAwesomeIcons.book),
  Category(12, "Sports", icon: FontAwesomeIcons.footballBall),
  Category(13, "Geography", icon: FontAwesomeIcons.mountain),
  Category(14, "History", icon: FontAwesomeIcons.monument),
  Category(15, "Art", icon: FontAwesomeIcons.paintBrush),
  Category(16, "Animals", icon: FontAwesomeIcons.dog),
  Category(17, "Vehicles", icon: FontAwesomeIcons.carAlt),
  Category(18, "Comics", icon: Icons.library_books),
  Category(19, "Japanese Anime & Manga", icon: FontAwesomeIcons.odnoklassniki),
  Category(20, "Cartoon & Animation", icon: FontAwesomeIcons.smileWink),
];
