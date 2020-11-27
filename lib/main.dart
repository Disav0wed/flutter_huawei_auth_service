import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_auth_kit/AuthServiceHelper.dart';

import 'package:flutter_auth_kit/register.dart';




void main()
{

  runApp(FlutterAuthApp());

}


class _DefaultAppState extends State<FlutterAuthApp>
{



  AuthServiceHelper _authServiceHelper =  AuthServiceHelper();

  TextEditingController emailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();









  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    home: Builder(
        builder: (context) =>

            Scaffold(
              appBar: AppBar(
                title: Text("Flutter Auth Kit Demo"),
              ),
              body: Column(
                children: <Widget>[
                  Container(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-Mail',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                  ),
                  Container(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      textAlign: TextAlign.center,
                      obscureText: true,
                    ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                  ),


                  RaisedButton(child: Text("Login")
                    ,onPressed: () => _authServiceHelper.login(emailController.text, passwordController.text),
                  ),

                  RaisedButton(child: Text("Register")
                      ,onPressed: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register(_authServiceHelper)));
                      }
                  )

                ],
              ),
            ),
    )
);
  }

}


class FlutterAuthApp extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    return _DefaultAppState();
  }


}