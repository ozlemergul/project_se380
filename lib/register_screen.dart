import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_screen.dart';
import 'employee_data_screen.dart'; // Import the screen where you want to use documentId

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRole = 'User'; // Default role

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Add Firestore logic to store user data, including the role
      DocumentReference documentReference = await FirebaseFirestore.instance.collection('Registers').add({
        'email': email,
        'password': password,
        'role': selectedRole,
      });

      String documentId = documentReference.id;
      print(documentId);

      // Navigate to the login screen with documentId
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => LoginScreen(title: ''), // Pass documentId as a parameter
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Register'),
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CupertinoTextField(
                controller: emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.inactiveGray,
                      width: 1,
                    ),
                  ),
                ),
              ),
              CupertinoTextField(
                controller: passwordController,
                placeholder: 'Password',
                padding: const EdgeInsets.all(16),
                obscureText: true,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.inactiveGray,
                      width: 1,
                    ),
                  ),
                ),
              ),
              // Role selection dropdown
              CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedRole = roles[index];
                  });
                },
                children: roles.map((String role) {
                  return Center(
                    child: Text(role),
                  );
                }).toList(),
              ),
              CupertinoButton(
                onPressed: registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> roles = ['User', 'Admin']; // Add more roles as needed
