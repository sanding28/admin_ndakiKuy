// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class BasecampModel extends Equatable {

  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String about;
  final int price;

  BasecampModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.about = '',
    this.price = 0,
  });

  factory BasecampModel.fromJson(String id, Map<String, dynamic> json) => 
  BasecampModel(
    id: id,
    name: json['name'],
    city: json['city'],
    imageUrl: json['imageUrl'],
    about: json['about'],
    price: json['price'],
  );

  @override
  List<Object?> get props => [id, name, city, imageUrl, about, price];

}