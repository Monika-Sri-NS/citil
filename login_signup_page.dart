import 'package:flutter/material.dart';
import 'student_details_page.dart';
import 'organizer_details_page.dart';
import 'student_home_page.dart';
import 'organizer_home_page.dart'; // ✅ Import OrganizerHomePage

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  String? userType;  // Student or Organizer
  String? actionType; // Login or Sign Up

  void _selectUserType() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Account Type"),
          actions: [
            TextButton(
              onPressed: () {
                setState(() => userType = 'Student');
                Navigator.pop(context);
                if (actionType == 'Sign Up') {
                  _askEmailAndPassword();
                } else {
                  _navigateToNext();
                }
              },
              child: const Text("Student"),
            ),
            TextButton(
              onPressed: () {
                setState(() => userType = 'Organizer');
                Navigator.pop(context);
                if (actionType == 'Sign Up') {
                  _askEmailAndPassword();
                } else {
                  _navigateToNext();
                }
              },
              child: const Text("Organizer"),
            ),
          ],
        );
      },
    );
  }

  void _askEmailAndPassword() {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    String? errorMessage;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Enter Email & Password"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: errorMessage == "email" ? "Email cannot be empty" : null,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: errorMessage == "password" ? "Password cannot be empty" : null,
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty) {
                      setState(() => errorMessage = "email");
                      return;
                    } else if (password.isEmpty) {
                      setState(() => errorMessage = "password");
                      return;
                    }

                    Navigator.pop(context);
                    _navigateToNext();
                  },
                  child: const Text("Continue"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToNext() {
    if (actionType == 'Login') {
      if (userType == 'Student') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentDetailsPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrganizerDetailsPage()),
        );
      }
    } else {
      // ✅ Fix: Navigate to the correct homepage after sign-up
      if (userType == 'Student') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentHomePage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrganizerHomePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            const Text("Already have an account?", style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () {
                setState(() => actionType = 'Login');
                _selectUserType();
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 20),
            const Text("New here? Create an account", style: TextStyle(fontSize: 16)),
            ElevatedButton(
              onPressed: () {
                setState(() => actionType = 'Sign Up');
                _selectUserType();
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

