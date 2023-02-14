import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'Please enter a valid value';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'User Name'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Login")),
                  OutlinedButton(
                      onPressed: () {}, child: Text("Create new account"))
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
