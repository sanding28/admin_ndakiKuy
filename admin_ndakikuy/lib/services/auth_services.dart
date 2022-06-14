// ignore_for_file: prefer_final_fields, unused_field, use_rethrow_when_possible

import 'package:admin_ndakikuy/models/admin_model.dart';
import 'package:admin_ndakikuy/services/admin_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AdminModel> signUp({
    required String email,
    required String password,
    required String name,
    required String basecamp,
  }) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AdminModel user = AdminModel(
        id: userCredential.user!.uid, 
        name: name, 
        email: email, 
        password: password, 
        basecamp: basecamp
      );

      //simpan data ke firestore
      await AdminServices().setUser(user);

      return user;
    } catch (e){
      throw e;
    }
  }

  Future<AdminModel>signIn({required String email, required String password}) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AdminModel user = await AdminServices().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

}