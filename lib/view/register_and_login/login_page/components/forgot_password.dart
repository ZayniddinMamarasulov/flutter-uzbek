import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
        },
        child: const Text(
          'Forgot password',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
