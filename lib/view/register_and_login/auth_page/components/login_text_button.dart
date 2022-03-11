import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/register_and_login/login_page/login_page.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Already have an account?  ',
            style: const TextStyle(
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                text: 'Login',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, LoginPage.id);
                    print('login');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
