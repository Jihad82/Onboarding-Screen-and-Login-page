import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement login logic
            final String email = _emailController.text.trim();
            final String password = _passwordController.text.trim();
            // Here you can add your login logic using the email and password entered by the user
            print('Email: $email');
            print('Password: $password');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(
                248, 13, 253, 65), // Change the background color to green
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
