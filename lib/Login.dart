import 'package:flutter/material.dart';
import 'package:hospital/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showErrorDialog("Please enter both email and password.");
      return;
    }

    try {
      // Sign in with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If login is successful, navigate to the homepage
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(
              userName: userCredential.user!.displayName ?? 'User',
              userEmail: email,
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      if (e.code == 'user-not-found') {
        showErrorDialog("No user found with this email.");
      } else if (e.code == 'wrong-password') {
        showErrorDialog("Incorrect password.");
      } else {
        showErrorDialog("An error occurred. Please try again.");
      }
    } catch (e) {
      // Print the full error and stack trace
      print("General Error: $e");
      print("Stack Trace: ${e.toString()}");
      showErrorDialog("An error occurred. Please try again.");
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Login Failed"),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background (Blue and White)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff0077B6), // Dark blue
                  Colors.white, // White
                ],
              ),
            ),
          ),
          // White Container with Rounded Corners
          Positioned(
            top: screenHeight * 0.4, // Adjust based on screen height
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.7, // Adjust based on screen height
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Login Card
          Positioned(
            top: screenHeight * 0.3, // Adjust based on screen height
            left: screenWidth * 0.1, // Adjust based on screen width
            right: screenWidth * 0.1, // Adjust based on screen width
            child: Material(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                width: screenWidth * 0.8, // Adjust based on screen width
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "DMS",
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined, size: 30),
                          label: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined, size: 30),
                          label: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff0077B6), // Dark blue for the button
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: loginUser,
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Logo
          Positioned(
            top: screenHeight * 0.03, // Slightly reduced top padding
            left: screenWidth * 0.05, // Reduced left margin
            right: screenWidth * 0.05, // Reduced right margin
            child: Container(
              width: screenWidth * 0.9, // Wider container
              height: screenHeight * 0.35, // Slightly taller
              child: Image.asset(
                "assets/images/logo_bg.png",
                width: double.infinity, // Full width inside container
                height: double.infinity, // Full height inside container
                color: Colors.white,
                fit: BoxFit.contain, // Maintains aspect ratio without stretching
              ),
            ),
          ),
        ],
      ),
    );
  }
}