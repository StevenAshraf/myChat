import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
AuthForm(this.submitfn);

final void Function(String email,
    String userName,
    String password,
    bool isLogin,
    BuildContext ctx,
    ) submitfn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
final _formKey = GlobalKey<FormState>();
var _islogin = true;
var _userEmail = '';
var _userName = '';
var _userPassword = '';

void _trySubmit() {
  final isValid =_formKey.currentState.validate();
  FocusScope.of(context).unfocus();

  if(isValid)
  {
    _formKey.currentState.save();
   widget.submitfn(
     _userEmail.trim(),
     _userName.trim(),
     _userPassword.trim(),
     _islogin,
     context,
   );
  }
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('Email'),
                    validator: (value) {
                      if(value.isEmpty || !value.contains('@'))
                      {
                        return 'please enter valid email address';
                      }
                      return null ;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if(!_islogin)
                  TextFormField(
                    key: ValueKey('Username'),
                    validator: (value) {
                      if(value.isEmpty || value.length < 4)
                      {
                        return 'please enter more than 4 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    onSaved: (value) {
                      _userName = value;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('Password'),
                    validator: (value) {
                      if(value.isEmpty || value.length < 7)
                      {
                        return 'please enter proper password bigger than 7 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(height: 12),
                  RaisedButton(
                    child: Text(_islogin ?'Login' : 'SignUp'),
                    onPressed: _trySubmit ,
                  ),
                  FlatButton(
                    child: Text(_islogin ? 'Create new account' : 'I already have an account'),
                    onPressed: () {
                      setState(() {
                        _islogin = !_islogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
