import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/register_and_login/signup_page/signup_page.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../view_model/them_vm.dart';
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: false,
                    onChanged: (newValue){

                    },
                  )
                ),
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
                  func: () {},
                ),
                const LoginTextButton(),
                const AgreementText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
