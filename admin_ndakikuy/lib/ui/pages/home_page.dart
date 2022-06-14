// ignore_for_file: prefer_const_constructors

import 'package:admin_ndakikuy/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

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

    Widget basecampCard(){
      return Container(
        height: 270,
        width: double.infinity,
        margin: EdgeInsets.only(left: 24, right: 24, top: 15),
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
                image: DecorationImage(image: AssetImage('assets/semeru.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gunung Semeru',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Lumajang Jawa Timur',
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

    Widget buttonButton(){
      return Container(
        margin: EdgeInsets.only(top: 40, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: (){}, 
              child: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  color: keyRadialColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Detail',
                    style: whiteTextStyle,
                  ),
                ),
              )
            ),
            TextButton(
              onPressed: (){}, 
              child: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  color: keyOrangeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: whiteTextStyle,
                  ),
                ),
              )
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          topBanner(),
          basecampCard(),
          buttonButton(),
        ],
      )
    );
  }
}