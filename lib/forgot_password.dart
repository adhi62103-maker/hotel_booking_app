import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/service.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F2),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Image.asset("assets/top.png", scale: 2),
            Text(
              "Forgot password",
              style: GoogleFonts.cinzel(
                color: Color(0xFF404B38),
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter your email and we'll\n      sent you a reset link",
              style: TextStyle(color: Color(0xFF404B38), fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Email",
                      style: TextStyle(color: Color(0xFF404B38)),
                    ),
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFF505A47),
                      ),
                      onPressed: () {
                        forgotfassword(
                          email: emailcontroller.text,
                          context: context,
                        );
                      },
                      child: Text(
                        "Send link",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF1EFE9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
