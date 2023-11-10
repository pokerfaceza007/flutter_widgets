import 'package:flutter/material.dart';
import 'package:flutter_widgets/sign_in/sign_in.dart';
import 'package:flutter_widgets/sign_up/sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.labelText,
    required this.pageRoute, required void Function() onTap,
  }) : super(key: key);

  final String labelText;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Material(
        elevation: 4, // Add a shadow to the button
        borderRadius: BorderRadius.circular(8), // Rounded corners
        child: InkWell(
          onTap: () {
            if (pageRoute == 'register') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            } else if (pageRoute == 'forgot') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SignUpScreen()), // Navigate to SignUpScreen for "Forgot Password"
              );
            } else if (pageRoute == 'signin') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            }

          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent, // Button color
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelText,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white, // Icon color
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
