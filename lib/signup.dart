import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Login.dart';
import 'package:hospital/homepage.dart';
import 'package:hospital/widgets/style.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;
  late Size mq;

  Future<void> signUp() async {
    if (emailController.text.isEmpty ||
        passController.text.isEmpty ||
        userController.text.isEmpty ||
        dobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }
    setState(() => _isLoading = true);
    try {
      await _firestore.collection('client').add({
        'email': emailController.text.trim(),
        'password': passController.text,
        'username': userController.text.trim(),
        'dob': dobController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(
            userName: userController.text.trim(),
            userEmail: emailController.text.trim(),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: mq.height,
          child: Column(
            children: [
              // Top Gradient Section
              Container(
                width: double.infinity,
                height: mq.height * .4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff0077B6), Color(0xff0096C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "LifeLine",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'Pacifico',
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      "assets/images/img1.png",
                      width: 250,
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // Bottom White Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .08),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    buildTextField("Email", emailController, false),
                    const SizedBox(height: 15),
                    buildTextField("Password", passController, true),
                    const SizedBox(height: 15),
                    buildTextField("Username", userController, false),
                    const SizedBox(height: 15),
                    buildDateField(),
                    const SizedBox(height: 20),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0077B6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget buildTextField(String hint, TextEditingController controller, bool isPassword) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
      ),
    );
  }

  // Custom Date Picker Widget
  Widget buildDateField() {
    return TextFormField(
      controller: dobController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: "Date of Birth",
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
        suffixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
      ),
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          dobController.text = "${selectedDate.toLocal()}".split(' ')[0];
        }
      },
    );
  }
}
