import 'package:flutter/material.dart';
import 'package:flutter_auth_kit/AuthServiceHelper.dart';





class Register extends StatelessWidget {

  AuthServiceHelper _authServiceHelper;

  Register(this._authServiceHelper);

  static const routeName = "/register";

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController verificationCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
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

              Container(
                child: TextField(
                  controller: verificationCodeController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Verification Code',
                  ),
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
              ),
              RaisedButton(child: Text("Get Verification Code")
                ,onPressed: () => _authServiceHelper.requestVerificationCode(emailController.text),
              ),
              RaisedButton(child: Text("Register")
                  ,onPressed: () => _authServiceHelper.registerWithEmail(emailController.text, passwordController.text, verificationCodeController.text),
              )
            ],
          ),
        ),
      );
  }
}
