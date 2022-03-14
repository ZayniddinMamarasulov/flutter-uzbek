import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/model/user.dart';

import '../../../home_page.dart';
import 'create_button.dart';
import 'custom_container_for_forms.dart';
import 'custom_input_decoration.dart';
import 'error_text.dart';

class SignUpFormFields extends StatefulWidget {
  const SignUpFormFields({Key? key}) : super(key: key);

  @override
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String pass = "";

  bool passError = false;
  bool nameError = false;
  bool emailError = false;

  String? errorText;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          nameFormField(),
          emailFormField(),
          passwordFormField(context),
          ErrorText(errorText: errorText),
          CreateButton(
            func: _func,
          ),
        ],
      ),
    );
  }

  void _func() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      _createAccount();

      if (!passError && !emailError & !nameError) {
        errorText = null;
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }

  _createAccount() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((current) {
        MyUser user = MyUser(
            id: current.user?.uid,
            fullName: name,
            email: email,
            userRole: 'user');
        _saveUserCredentials(user);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showMessage("The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showMessage("The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      _showMessage(e);
      print(e);
    }
  }

  _saveUserCredentials(MyUser user) async {
    final CollectionReference userCollections =
        FirebaseFirestore.instance.collection('users');

    try {
      final userDoc = userCollections.doc(user.id);
      await userDoc.set(user.toJson()).then((value) {
        Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (r) => false);
      });
    } catch (e) {
      print("user-collection-exception: $e");
    }
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

  CustomContainer passwordFormField(context) {
    return CustomContainer(
      titleForm: 'Password',
      child: TextFormField(
        onSaved: (value) {
          pass = value!;
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
                  ? 'Parol belgilar soni kamida 8 ta bo\'lishi kerak!'
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
      child: TextFormField(
        onSaved: (value) {
          email = value!;
        },
        style: const TextStyle(color: Colors.black),
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

  CustomContainer nameFormField() {
    return CustomContainer(
      titleForm: 'Name',
      child: TextFormField(
        onSaved: (value) {
          name = value!;
        },
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value!.isEmpty) {
            nameError = true;
            setState(() {
              errorText = nameError ? 'Maydonlarni to\'ldiring!' : null;
            });
          } else {
            setState(() {
              nameError = false;
            });
          }
        },
        decoration: customInputDecoration(nameError, 'Your name'),
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
}
