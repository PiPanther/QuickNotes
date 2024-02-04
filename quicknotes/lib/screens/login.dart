import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/components/button.dart';
import 'package:quicknotes/components/textfield.dart';
import 'package:quicknotes/screens/register.dart';
import 'package:quicknotes/styles/app_styles.dart';
// import '';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordCOntroller = TextEditingController();

    void signIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordCOntroller.text.trim());
      } on FirebaseAuthException catch (e) {
        if (e.code == "invalid-credential") {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Enter correct Credentials')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.code)));
        }
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyle.bgcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Icon(
                Icons.notes_outlined,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Text(
                'FireNotes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  // border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    MyTextField(
                        hintText: 'Email',
                        emailController: _emailController,
                        pageIcon: const Icon(Icons.email_outlined)),
                    MyTextField(
                      emailController: _passwordCOntroller,
                      pageIcon: const Icon(Icons.password),
                      hintText: 'Password',
                    ),
                    MyButton(
                      text: 'Login',
                      onTap: signIn,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Not a member? '),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        // const Spacer(),
                      ],
                    )
                    // Spacer()
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
