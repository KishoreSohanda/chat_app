import 'dart:io';

import 'package:flutter/material.dart';

import '../pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    String username,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  final bool _isloading;
  const AuthForm(this.submitFn, this._isloading, {super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  File? _userImageFile;

  String? _userEmail = '';
  String? _userName = '';
  String? _userPassword = '';

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.error,
          content: const Text('Please pick an image.'),
        ),
      );
      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail!.trim(),
        _userPassword!.trim(),
        _userName!.trim(),
        _userImageFile ?? File(''),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_isLogin) UserImagePicker(_pickedImage),
                    TextFormField(
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      key: const ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(labelText: 'E-mail Address'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email-address.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userEmail = newValue;
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        enableSuggestions: false,
                        key: const ValueKey('username'),
                        decoration:
                            const InputDecoration(labelText: 'User Name'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Please enter at least 4 characters username.';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userName = newValue;
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('password'),
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Password must be at least 7 characters long.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _userPassword = newValue;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (widget._isloading) const CircularProgressIndicator(),
                    if (!widget._isloading)
                      ElevatedButton(
                        onPressed: _trySubmit,
                        child: Text(_isLogin ? 'Login' : 'SignUp'),
                      ),
                    if (!widget._isloading)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? 'Create new account'
                            : 'I already have an account'),
                      ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
