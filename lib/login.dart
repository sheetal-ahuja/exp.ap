import 'package:auto_size_text/auto_size_text.dart';
import 'package:expenses_tracker/app_view.dart';
import 'package:expenses_tracker/register.dart';
import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void goToRegisterPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Login3();
    }));
  }

  void onLoginSuccess() {
    print("Hello");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const MyAppView();
    }));
  }

  void login() async {
    setState(() {
      isLoading = true;
    });

    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Sign in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // On login success
      // SnackBar(content: Text("Logged In!"));
      onLoginSuccess();
    } on FirebaseAuthException catch (e) {
      // Handle errors
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.message ?? 'An unknown error occurred.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: width * 0.1),
                Flexible(
                  child: AutoSizeText(
                    "LOGIN",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 1, 10, 89),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 1, 10, 89),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'EMAIL',
                              style: GoogleFonts.aldrich(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 1, 10, 89),
                              ),
                            ),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 1, 10, 89),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'PASSWORD',
                              style: GoogleFonts.aldrich(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 1, 10, 89),
                              ),
                            ),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 10, 89),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DON'T HAVE AN ACCOUNT?",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: goToRegisterPage,
                  child: Text(
                    "REGISTER",
                    style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 29, 137, 40),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
