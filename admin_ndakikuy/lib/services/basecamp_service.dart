// ignore_for_file: prefer_final_fields, unused_field, use_rethrow_when_possible

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_ndakikuy/models/basecamp_model.dart';

class BasecampService{
  CollectionReference _basecampRef = FirebaseFirestore.instance.collection('basecamp');

  Future<List<BasecampModel>> fetchBasecamp() async{
    try {
      QuerySnapshot result = await _basecampRef.get();
      
      List<BasecampModel> basecamp = result.docs.map((e){
        return BasecampModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return basecamp;
    } catch (e) {
      throw e;
    }
  }

  Future updateBasecamp(BasecampModel basecamp) async{
    return await _basecampRef.doc(basecamp.id).update({
      'name': basecamp.name,
      'city': basecamp.city,
      'imageUrl': basecamp.imageUrl,
      'about': basecamp.about,
      'price': basecamp.price,
    });
  }

}