import 'package:aplicatie_polihack_v15/Authentication/firebase_auth_methods.dart';
import 'package:aplicatie_polihack_v15/Authentication/form_container.dart';
import 'package:aplicatie_polihack_v15/Authentication/selection_sign_up_page.dart';
import 'package:aplicatie_polihack_v15/Authentication/signup_for_user.dart';
import 'package:aplicatie_polihack_v15/global/common/toast.dart';
import 'package:aplicatie_polihack_v15/loading_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSigningIn = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingScreen()),
                  (route) => false);
            },
          ),
          title: Text(
            "SkillBoost",
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Login",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _signIn,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(17, 138, 178, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: isSigningIn
                          ? CircularProgressIndicator(
                              color: Color.fromRGBO(17, 138, 178, 1))
                          : Text(
                              "Login",
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectionSignUp()),
                          (route) => false);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(17, 138, 178, 1),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }

  void _signIn() async {
    setState(() {
      isSigningIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    User? provider = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigningIn = false;
    });

    if (user != null) {
      showToast(message: "Successfully signed in");

      if (provider != null) {
        showToast(message: "Successfully signed in");

        //extragem informatii pe baza uid
        DocumentSnapshot providerDoc = await FirebaseFirestore.instance
            .collection('providers')
            .doc(provider.uid)
            .get();
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists || providerDoc.exists) {
          // daca documentul utilizatorului exista atunci extragem informatii

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoadingScreen()),
          );
        } else {
          // documentul utilizatorului nu exista in baza de date
          showToast(message: "User data not found");
        }
      } else {
        showToast(message: "Some error occurred");
      }
    }
  }
}
