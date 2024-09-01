import 'package:auto_size_text/auto_size_text.dart';
import 'package:expenses_tracker/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login3 extends StatefulWidget {
  const Login3();

  @override
  _Login3 createState() => _Login3();
}

class _Login3 extends State<Login3> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void navigateToStep2() async {
    setState(() {
      isLoading = true;
    });

    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Create a new user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the next step
      // widget.navigateToLogin4(email, phoneController.text.trim(), password);
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
      const SnackBar(content: Text("Account Created Successfuly"));
      navigateToLogin();
      setState(() {
        isLoading = false;
      });
    }
  }
  void navigateToLogin()
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {return LoginPage();}));
  }
  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    "CREATE ACCOUNT",
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
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 1, 10, 89),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'PHONE NUMBER',
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
                    onPressed: navigateToStep2,
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
                      'CONTINUE',
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
                  'ALREADY HAVE AN ACCOUNT ?',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: navigateToLogin,
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 29, 137, 40),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
