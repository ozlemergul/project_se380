
import 'package:flutter/material.dart';
import 'login_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();


}

class _ProfileScreenState extends State<ProfileScreen> {
  String _newPassword = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
              ),
              child: const Icon(
                Icons.person,
                size: 75.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'MANAGER',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(185, 50),
                backgroundColor: Colors.teal[100],

              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
              onPressed: () {
                _logout();
              },
            ),
          ],
        ),

      ),

    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController _newPasswordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();


    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Accept'),
            onPressed: () {
              if (_newPasswordController.text.isNotEmpty && _newPasswordController.text == _confirmPasswordController.text) {
                // Perform password change logic here
                _showSuccessDialog("Password changed successfully.");

              } else if(_newPasswordController.text.isEmpty) {
                _showErrorDialog('Please fill in the blanks.');
              }
              else {
                _showErrorDialog('Passwords do not match.');
              }

            },
          ),
        ],
      ),
    );
  }


  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Password changed successfully.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },

          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _logout() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen(title: "")));
  }
}
