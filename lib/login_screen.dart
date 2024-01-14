import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se380_project/register_screen.dart';
import 'home_screen.dart';
import 'employee_data_screen.dart'; // Import the EmployeeDataScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userPhotoPath; // Initialize with null
  String selectedRole = 'User'; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.teal[100],
                  radius: 50,
                  backgroundImage: userPhotoPath != null
                      ? FileImage(
                    Image.file(File(userPhotoPath!)) as File,
                  )
                      : null,
                  child: userPhotoPath == null
                      ? const Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.black,
                  )
                      : null,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              // Role selection segmented control
              CupertinoSegmentedControl(
                children: const {
                  'User': Text('User'),
                  'Admin': Text('Admin'),
                },
                onValueChanged: (value) {
                  setState(() {
                    selectedRole = value.toString();
                  });
                },
                groupValue: selectedRole,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal[100],
                    ),
                    onPressed: () async {
                      try {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        String role = selectedRole;
                        QuerySnapshot querySnapshot =
                        await FirebaseFirestore.instance
                            .collection('Registers')
                            .where('email', isEqualTo: email)
                            .where('password', isEqualTo: password)
                            .where('role', isEqualTo: role)
                            .get();

                        if (querySnapshot.docs.isNotEmpty) {
                          // Credentials are valid
                          if (role == 'Admin') {
                            // Navigate to the Home screen for regular users
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } else if (role == 'User') {
                            // Navigate to the EmployeeDataScreen for admins
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EmployeeDataScreen(),
                              ),
                            );
                          }
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid credentials'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[100],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}