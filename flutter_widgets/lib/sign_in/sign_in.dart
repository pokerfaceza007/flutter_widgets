import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_widgets/component/my_button.dart';
import 'package:flutter_widgets/component/my_iconbutton.dart';
import 'package:flutter_widgets/component/my_textbutton.dart';
import 'package:flutter_widgets/component/my_textfield.dart';
import 'package:flutter_widgets/fitness_app/fitness_app_home_screen.dart';
import 'package:flutter_widgets/login_sucess_page.dart';
import 'package:flutter_widgets/sign_up/sign_up.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  

  void signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Show a success dialog with a checkmark icon
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              FontAwesomeIcons.checkCircle,
              color: Colors.green,
              size: 48,
            ),
            content: Text("Login Successful"),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => FitnessAppHomeScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'invalid_email') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = 'An error occurred during sign-in.';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Icon(
              Icons.close,
              color: Colors.red,
              size: 48,
            ),
            content: Text("Wrong password and user."),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputTextStyle = TextStyle(fontSize: 16);
    final InputDecoration inputDecoration = InputDecoration(
      hintText: 'Enter your email',
      labelText: 'Email',
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello, ready to get started",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Please sign in with your email and password.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                secureText: false,
                textStyle: inputTextStyle,
                inputDecoration: inputDecoration,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                labelText: 'Password',
                secureText: true,
                textStyle: inputTextStyle,
                inputDecoration: inputDecoration,
              ),
              const SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  // Handle 'Forgot Password' functionality here
                  // You can add code to reset the password or navigate to the password reset screen
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: signInWithEmailAndPassword,
                hinText: 'Sign In',
              ),
              const SizedBox(height: 25),
              Divider(
                thickness: 0.5,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              Text(
                'Or continue with',
                style: TextStyle(color: Colors.yellowAccent.shade700),
              ),
              const SizedBox(height: 20),
              Divider(
                thickness: 0.5,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButton(imagePath: 'lib/assets/image/Facebook.png'),
                  SizedBox(width: 10),
                  MyIconButton(imagePath: 'lib/assets/image/Google.png'),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    MyTextButton(
                      labelText: 'Register Now!',
                      pageRoute: 'register',
                      onTap: () => navigateToSignUp(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
