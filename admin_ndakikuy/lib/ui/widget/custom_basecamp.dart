// ignore_for_file: prefer_const_constructors

import 'package:admin_ndakikuy/models/basecamp_model.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomBasecamp extends StatelessWidget {
  final BasecampModel basecamp;
  const CustomBasecamp(this.basecamp,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: keybackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 23),
            height: 140,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(basecamp.imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  basecamp.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  basecamp.city,
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: reguler,
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

