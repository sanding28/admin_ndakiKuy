// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_ndakikuy/cubit/auth_cubit.dart';
import 'package:admin_ndakikuy/shared/theme.dart';
import 'package:admin_ndakikuy/ui/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget bannerLogo(){
      return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: keyPrimaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
        child: Container(
          margin: EdgeInsets.only(left: 24, top: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 102,
                height: 72,
                
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png')
                  )
                ),
              ),
              SizedBox(height: 14,),
              Text(
                'Welcome Admins',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                'Sign-in to continue',
                style: whiteTextStyle,
              )
            ],
          ),
        ),
      );
    }

    Widget inpuSection(){

      Widget emailInput(){
        return Container(
          margin: EdgeInsets.only(top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email address',
                style: blackTextStyle,
              ),
              SizedBox(height: 6,),
              TextFormField(
                controller: emailController,
                cursorColor: keyBlackColor,
                decoration: InputDecoration(
                  hintText: 'Input your email...',
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
                  hintText: 'Input your password',
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
              } else if (state is AuthFailed){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: keyOrangeColor,
                  )
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return TextButton(
                onPressed: (){
                  context.read<AuthCubit>().signIn(email: emailController.text , password: passwordController.text);
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
                      'Login',
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
                'Don\'t have an account?',
                style: blackTextStyle,
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                }, 
                child: Text(
                  'Sign Up',
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
          bannerLogo(),
          inpuSection(),
          button()
        ],
      )
    );
  }
}