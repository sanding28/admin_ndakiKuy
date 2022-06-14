// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {

  final String id;
  final String name;
  final String email;
  final String password;
  final String basecamp;

  AdminModel(
    {
      required this.id, 
      required this.name, 
      required this.email, 
      required this.password, 
      required this.basecamp
    }
  );

  @override
  List<Object?> get props => [id, name, email, password, basecamp];
  
}