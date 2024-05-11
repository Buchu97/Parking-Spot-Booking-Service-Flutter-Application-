import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvp_mq/firebase_auth/auth_service.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/service_button.dart';
import 'package:mvp_mq/sign_up.dart';

class LoginScreen extends StatefulWidget {
  
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState(){
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

 
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
       User? user = await FireBaseAuthService().signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text);
      if (user != null) {
        Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) =>  MQHome(),)
  );
      } else {
       final String errorMessage = FirebaseAuth.instance.currentUser?.toString() ?? "Login Failed. Try Again!";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration:const Duration(seconds: 5),
          ),
        );
        print(errorMessage);
      }
    }
  }

  @override
void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password cannot be empty' : null,
              
              ),
            ),
            ServiceButton(
              nextPage:_submit,
              text: 'Login',
            ),
            TextButton(
              onPressed: () {
                
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignupScreen(),)
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
