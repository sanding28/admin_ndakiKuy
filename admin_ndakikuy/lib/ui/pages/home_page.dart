// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_ndakikuy/services/basecamp_service.dart';
import 'package:admin_ndakikuy/shared/theme.dart';
import 'package:admin_ndakikuy/ui/widget/custom_basecamp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/basecamp_cubit.dart';
import '../../models/basecamp_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _basecampName = TextEditingController();
  final TextEditingController _basecampDes = TextEditingController();
  final TextEditingController _basecampCity = TextEditingController();

  @override
  void initState() {
     context.read<BasecampCubit>().fetchBasecamp();
    super.initState();
  }

  updateData(BasecampModel basecamp) async{
    await BasecampService().updateBasecamp(basecamp);
  }

  @override
  Widget build(BuildContext context) {

    Widget topBanner(){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang Admin',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        )
      );
    }

    Widget basecampCard(List<BasecampModel> basecamp){
      return Container(
        margin:EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child: Column(
          children: basecamp.map((BasecampModel basecamp) {
            return CustomBasecamp(basecamp);
          }).toList(),
        )
      );
    }

    return BlocConsumer<BasecampCubit, BasecampState>(
      listener: (context, state) {
        if(state is BasecampFailed){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: keyOrangeColor,
              content: Text(state.error),
            )
          );
        }
      },
      builder: (context, state) {
        if(state is BasecampSuccess){
          return Scaffold(
            appBar: AppBar(
              title: Text('Basecamp'),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    openDialogBox(context);
                  }, 
                  child: Icon(Icons.add),
                )
              ],
            ),
            body: ListView(
              children: [
                topBanner(),
                basecampCard(state.basecamp),
              ],
            )
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  openDialogBox(BuildContext context){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Ubah Data Basecamp'),
          content: Container(
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: _basecampName,
                  decoration: InputDecoration(hintText: 'Nama Basecamp'),
                ),
                TextField(
                  controller: _basecampCity,
                  decoration: InputDecoration(hintText: 'Kota Basecamp'),
                ),
                TextField(
                  controller: _basecampDes,
                  decoration: InputDecoration(hintText: 'deskripsi Basecamp'),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
                final docUser = FirebaseFirestore.instance.collection('basecamp');
                docUser.add({
                  'name': _basecampName.text,
                  'city': _basecampCity.text,
                  'about': _basecampDes.text,
                });
                Navigator.pop(context);
              }, 
              child: Text('Submit')
            )
          ],
        );
      }
    );
  }

  submitActions(BuildContext context){
    updateData(BasecampModel(
      name: _basecampName.text,
      city: _basecampCity.text,
      about: _basecampDes.text, id: '',
    ));
  }

}