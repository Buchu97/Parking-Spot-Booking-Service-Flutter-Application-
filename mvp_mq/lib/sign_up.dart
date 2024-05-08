import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvp_mq/firebase_auth/auth_service.dart';
import 'package:mvp_mq/service_button.dart';
import 'package:mvp_mq/sign_in.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key,required this.toggleTheme});
   final void Function(bool) toggleTheme;
  @override
  State<SignupScreen> createState(){
    return _SignupScreenState();
  }
  
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      User? user = await FireBaseAuthService().signUpWithEmailAndPassword(
        _emailController.text, _passwordController.text);
        print("Attempting to sign up with email: $_emailController.text and password: $_passwordController.text");
      if (user != null) {
        Navigator.of(context).push(
         MaterialPageRoute(builder: (context) =>  LoginScreen(toggleTheme: widget.toggleTheme)),
          );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
            content: Text('Sign Up Failed. Try Again!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
 @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Username cannot be empty' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                 controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email cannot be empty' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
               controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value!.isEmpty ? 'Password cannot be empty' : null,
              ),
            ),
            ServiceButton(
              text:  'Signup',
              nextPage: (){
                _submit();
                
              },
              // onPressed: _submit,
              // child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
