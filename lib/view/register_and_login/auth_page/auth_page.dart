import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/register_and_login/signup_page/signup_page.dart';
import 'package:flutter_uzbek/view_model/auth_vm.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../view_model/them_vm.dart';
import '../../home_page.dart';
import 'components/agreement_text.dart';
import 'components/login_text_button.dart';
import 'components/sign_buttons.dart';
import 'components/welcome_text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const String id = 'auth_page';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Consumer<AuthViewModel>(builder: (context, data, child) {
        if (data.authStatus == AuthStatus.LOADING) {
          return const Center(child: CircularProgressIndicator());
        }
        if (data.authStatus == AuthStatus.COMPLETED) {
          Future.delayed(Duration.zero, () async {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.id, (r) => false);
          });
        }
        if (data.authStatus == AuthStatus.ERROR) {
          return Center(child: Text(data.errorMessage ?? "ERROR"));
        } else {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Switch(
                        value: false,
                        onChanged: (newValue) {},
                      )),
                  const WelcomeText(),
                  SignButtons(
                    color: Colors.black,
                    icon: 'assets/images/sms.png',
                    txt: 'Continue with Email',
                    func: () {
                      Navigator.pushNamed(context, SignupPage.id);
                      print('email');
                    },
                  ),
                  SignButtons(
                    color: Colors.blue,
                    icon: 'assets/images/fb_icon.png',
                    txt: 'Continue with Facebook',
                    func: () {
                      print('facebook');
                    },
                  ),
                  SignButtons(
                    color: Colors.white,
                    icon: 'assets/images/google_icon.png',
                    txt: 'Continue with Google',
                    func: () {
                      final authVM =
                          Provider.of<AuthViewModel>(context, listen: false);
                      authVM.googleLogin();
                    },
                  ),
                  const LoginTextButton(),
                  const AgreementText(),
                ],
              ),
            ),
          );
        }
      })),
    );
  }
}
