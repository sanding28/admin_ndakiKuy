// ignore_for_file: prefer_final_fields, use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/admin_model.dart';

class AdminServices {
  CollectionReference _adminReference = FirebaseFirestore.instance.collection('admins');

  Future<void> setUser(AdminModel user) async {
    try {
      _adminReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'password': user.password,
        'basecamp': user.basecamp,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<AdminModel> getUserById(String id)async{
    try {
      DocumentSnapshot snapshot = await _adminReference.doc(id).get();
      return AdminModel(
        id: id, 
        name: snapshot['name'], 
        email: snapshot['email'], 
        password: snapshot['password'], 
        basecamp: snapshot['basecamp'],
      );
    } catch (e) {
      throw e;
    }
  }
}