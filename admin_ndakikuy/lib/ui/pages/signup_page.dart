// ignore_for_file: prefer_const_constructors

import 'package:admin_ndakikuy/cubit/auth_cubit.dart';
import 'package:admin_ndakikuy/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({ Key? key }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController basecampController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget inpuSection(){
      Widget emailInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'alamat email',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: emailController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan alamat email...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      Widget nameInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: nameController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'masukan nama anda...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      Widget asalBasecampInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Asal Basecamp',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: basecampController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'Asal basecamp...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      Widget passwordInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: passwordController,
                cursorColor: keyBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'masukan paswword anda...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: keyPrimaryColor),
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              )
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        decoration: BoxDecoration(
          color: keyWhiteColor
        ),
        child: Column(
          children: [
            nameInput(),
            asalBasecampInput(),
            emailInput(),
            passwordInput()
          ],
        ),
      );
    }

   Widget button(){
      return Column(
        children: [
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is AuthSucess){
                Navigator.pushNamedAndRemoveUntil(context, '/main-Page', (route) => false);
              }
              else if (state is AuthFailed){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: keyOrangeColor,
                  )
                );
              }
            },
            builder: (context, state) {
              if(state is AuthLoading){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return TextButton(
                onPressed: (){
                  context.read<AuthCubit>().signUp(
                    email: emailController.text, 
                    password: passwordController.text, 
                    name: nameController.text, 
                    basecamp: basecampController.text
                  );
                }, 
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 35,
                  width: 200,
                  decoration: BoxDecoration(
                    color: keyOrangeColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child:Text(
                      'Sign Up',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                  ),
              ));
            },
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: blackTextStyle,
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }, 
                child: Text(
                  'Login',
                  style: orangeTextStyle,
                )
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          inpuSection(),
          button()
        ],
      ),
    );
  }
}