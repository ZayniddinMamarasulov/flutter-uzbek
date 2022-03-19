import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../view_model/auth_vm.dart';
import '../../../home_page.dart';
import 'forgot_password.dart';

import 'create_button.dart';
import 'custom_container_for_forms.dart';
import 'custom_input_decoration.dart';
import 'error_text.dart';

class FormFields extends StatefulWidget {
  FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String email = "";
  String password = "";

  bool passError = false;
  bool nameError = false;
  bool emailError = false;

  String? errorText;

  final _emailController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<AuthViewModel>(builder: (context, data, child) {
          if (data.authStatus == AuthStatus.LOADING) {
            return const CircularProgressIndicator();
          }
          if (data.authStatus == AuthStatus.COMPLETED) {
            Future.delayed(Duration.zero, () async {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.id, (r) => false);
            });
          }
          if (data.authStatus == AuthStatus.ERROR) {
            return Center(child: Text(data.errorMessage ?? "ERROR"));
          }
          return Column(
            children: [
              emailFormField(),
              passwordFormField(context),
              const ForgotPasswordButton(),
              ErrorText(errorText: errorText),
              _isLoading
                  ? Center(child: const CircularProgressIndicator())
                  : Container(),
              LoginButton(
                func: _func,
              ),
            ],
          );
        }));
  }

  void _func() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      final authVM = Provider.of<AuthViewModel>(context, listen: false);
      authVM.signIn(email, password);

      if (!passError && !emailError & !nameError) {
        errorText = null;
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }

  void showLoader(bool isLoad) {
    if (isLoad) {
      setState(() {
        _isLoading = true;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  CustomContainer passwordFormField(context) {
    return CustomContainer(
      titleForm: 'Password',
      isError: passError,
      child: TextFormField(
        onSaved: (value) {
          password = value!;
        },
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              errorText = passError ? 'Maydonlarni to\'ldiring!' : null;
            });
            passError = true;
          } else if (value.length < 8) {
            setState(() {
              passError = true;
              errorText = passError
                  ? 'Parol belgilari soni kamida 8 ta bo\'lishi kerak!'
                  : null;
            });
          } else {
            setState(() {
              passError = false;
            });
          }
        },
        decoration: customPasswordInputDecoration(passError, 'Your password'),
        obscureText: !_showPassword,
      ),
    );
  }

  CustomContainer emailFormField() {
    return CustomContainer(
      titleForm: 'Email',
      isError: emailError,
      child: TextFormField(
        onSaved: (value) {
          email = value!;
        },
        style: const TextStyle(color: Colors.black),
        controller: _emailController,
        validator: (value) {
          if (value!.isEmpty) {
            setState(() {
              errorText = emailError ? 'Maydonlarni to\'ldiring!' : null;
            });
            emailError = true;
          } else if (!(RegExp('@').hasMatch(value))) {
            setState(() {
              emailError = true;
              errorText = null;
            });
          } else {
            setState(() {
              emailError = false;
            });
          }
        },
        decoration: customInputDecoration(emailError, 'Your email address'),
      ),
    );
  }

  InputDecoration customPasswordInputDecoration(bool isError, String hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      suffixIcon: IconButton(
        onPressed: () {
          _toggleVisibility();
        },
        icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
      ),
      border: isError
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            )
          : InputBorder.none,
      hintText: hintText,
      // hintStyle: TextStyle(color: Colors.black),
      enabledBorder: isError
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            )
          : InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: (isError ? Colors.red : Colors.lightBlue)),
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  _showMessage(message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Text(message),
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
