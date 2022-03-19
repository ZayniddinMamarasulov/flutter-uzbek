import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view_model/auth_vm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  final _picker = ImagePicker();
  File _selectedImage = File('');

  String name = "";
  String email = "";
  String pass = "";
  String userimageUrl = "";

  bool passError = false;
  bool nameError = false;
  bool emailError = false;
  bool _isLoading = false;

  String? errorText;

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
              Container(
                child: _isLoading
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: _selectedImage.path != ''
                                  ? Container(
                                      height: 150,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          _selectedImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: const Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.black45,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
              ),
              nameFormField(),
              emailFormField(),
              passwordFormField(context),
              ErrorText(errorText: errorText),
              CreateButton(
                func: _func,
              ),
            ],
          );
        }));
  }

  void _func(context) {
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
    final authVM = Provider.of<AuthViewModel>(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    final downloadUrl = await authVM.uploadAvatar(name, _selectedImage);

    authVM.createUser(name, email, pass, downloadUrl);
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

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
